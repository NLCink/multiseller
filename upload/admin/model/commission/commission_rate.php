<?php
class ModelcommissioncommissionRate extends Model {
	public function addcommissionRate($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "commission_rate SET name = '" . $this->db->escape($data['name']) . "', rate = '" . (float)$data['rate'] . "', `type` = '" . $this->db->escape($data['type']) . "', geo_zone_id = '" . (int)$data['geo_zone_id'] . "', date_added = NOW(), date_modified = NOW()");

		$commission_rate_id = $this->db->getLastId();

		if (isset($data['commission_rate_seller_group'])) {
			foreach ($data['commission_rate_seller_group'] as $seller_group_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "commission_rate_to_seller_group SET commission_rate_id = '" . (int)$commission_rate_id . "', seller_group_id = '" . (int)$seller_group_id . "'");
			}
		}
	}

	public function editcommissionRate($commission_rate_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "commission_rate SET name = '" . $this->db->escape($data['name']) . "', rate = '" . (float)$data['rate'] . "', `type` = '" . $this->db->escape($data['type']) . "', geo_zone_id = '" . (int)$data['geo_zone_id'] . "', date_modified = NOW() WHERE commission_rate_id = '" . (int)$commission_rate_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "commission_rate_to_seller_group WHERE commission_rate_id = '" . (int)$commission_rate_id . "'");

		if (isset($data['commission_rate_seller_group'])) {
			foreach ($data['commission_rate_seller_group'] as $seller_group_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "commission_rate_to_seller_group SET commission_rate_id = '" . (int)$commission_rate_id . "', seller_group_id = '" . (int)$seller_group_id . "'");
			}
		}
	}

	public function deletecommissionRate($commission_rate_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "commission_rate WHERE commission_rate_id = '" . (int)$commission_rate_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "commission_rate_to_seller_group WHERE commission_rate_id = '" . (int)$commission_rate_id . "'");
	}

	public function getcommissionRate($commission_rate_id) {
		$query = $this->db->query("SELECT tr.commission_rate_id, tr.name AS name, tr.rate, tr.type, tr.geo_zone_id, gz.name AS geo_zone, tr.date_added, tr.date_modified FROM " . DB_PREFIX . "commission_rate tr LEFT JOIN " . DB_PREFIX . "geo_zone gz ON (tr.geo_zone_id = gz.geo_zone_id) WHERE tr.commission_rate_id = '" . (int)$commission_rate_id . "'");

		return $query->row;
	}

	public function getcommissionRates($data = array()) {
		$sql = "SELECT tr.commission_rate_id, tr.name AS name, tr.rate, tr.type, gz.name AS geo_zone, tr.date_added, tr.date_modified FROM " . DB_PREFIX . "commission_rate tr LEFT JOIN " . DB_PREFIX . "geo_zone gz ON (tr.geo_zone_id = gz.geo_zone_id)";

		$sort_data = array(
			'tr.name',
			'tr.rate',
			'tr.type',
			'gz.name',
			'tr.date_added',
			'tr.date_modified'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY tr.name";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getcommissionRatesellerGroups($commission_rate_id) {
		$commission_seller_group_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "commission_rate_to_seller_group WHERE commission_rate_id = '" . (int)$commission_rate_id . "'");

		foreach ($query->rows as $result) {
			$commission_seller_group_data[] = $result['seller_group_id'];
		}

		return $commission_seller_group_data;
	}

	public function getTotalcommissionRates() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "commission_rate");

		return $query->row['total'];
	}

	public function getTotalcommissionRatesByGeoZoneId($geo_zone_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "commission_rate WHERE geo_zone_id = '" . (int)$geo_zone_id . "'");

		return $query->row['total'];
	}
}
