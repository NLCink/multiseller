<?php
class ControllercommissioncommissionRate extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('commission/commission_rate');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('commission/commission_rate');

		$this->getList();
	}

	public function add() {
		$this->load->language('commission/commission_rate');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('commission/commission_rate');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_commission_commission_rate->addcommissionRate($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('commission/commission_rate', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function edit() {
		$this->load->language('commission/commission_rate');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('commission/commission_rate');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_commission_commission_rate->editcommissionRate($this->request->get['commission_rate_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('commission/commission_rate', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function delete() {
		$this->load->language('commission/commission_rate');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('commission/commission_rate');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $commission_rate_id) {
				$this->model_commission_commission_rate->deletecommissionRate($commission_rate_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('commission/commission_rate', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	protected function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'tr.name';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('commission/commission_rate', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);

		$data['insert'] = $this->url->link('commission/commission_rate/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['delete'] = $this->url->link('commission/commission_rate/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$data['commission_rates'] = array();

		$filter_data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);

		$commission_rate_total = $this->model_commission_commission_rate->getTotalcommissionRates();

		$results = $this->model_commission_commission_rate->getcommissionRates($filter_data);

		foreach ($results as $result) {
			$data['commission_rates'][] = array(
				'commission_rate_id'   => $result['commission_rate_id'],
				'name'          => $result['name'],
				'rate'          => $result['rate'],
				'type'          => ($result['type'] == 'F' ? $this->language->get('text_amount') : $this->language->get('text_percent')),
				'geo_zone'      => $result['geo_zone'],
				'date_added'    => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'date_modified' => date($this->language->get('date_format_short'), strtotime($result['date_modified'])),
				'edit'          => $this->url->link('commission/commission_rate/edit', 'token=' . $this->session->data['token'] . '&commission_rate_id=' . $result['commission_rate_id'] . $url, 'SSL')
			);
		}

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_rate'] = $this->language->get('column_rate');
		$data['column_type'] = $this->language->get('column_type');
		$data['column_geo_zone'] = $this->language->get('column_geo_zone');
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_date_modified'] = $this->language->get('column_date_modified');
		$data['column_action'] = $this->language->get('column_action');

		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_name'] = $this->url->link('commission/commission_rate', 'token=' . $this->session->data['token'] . '&sort=tr.name' . $url, 'SSL');
		$data['sort_rate'] = $this->url->link('commission/commission_rate', 'token=' . $this->session->data['token'] . '&sort=tr.rate' . $url, 'SSL');
		$data['sort_type'] = $this->url->link('commission/commission_rate', 'token=' . $this->session->data['token'] . '&sort=tr.type' . $url, 'SSL');
		$data['sort_geo_zone'] = $this->url->link('commission/commission_rate', 'token=' . $this->session->data['token'] . '&sort=gz.name' . $url, 'SSL');
		$data['sort_date_added'] = $this->url->link('commission/commission_rate', 'token=' . $this->session->data['token'] . '&sort=tr.date_added' . $url, 'SSL');
		$data['sort_date_modified'] = $this->url->link('commission/commission_rate', 'token=' . $this->session->data['token'] . '&sort=tr.date_modified' . $url, 'SSL');

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $commission_rate_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('commission/commission_rate', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($commission_rate_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($commission_rate_total - $this->config->get('config_limit_admin'))) ? $commission_rate_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $commission_rate_total, ceil($commission_rate_total / $this->config->get('config_limit_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('commission/commission_rate_list.tpl', $data));
	}

	protected function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_form'] = !isset($this->request->get['commission_rate_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
		$data['text_percent'] = $this->language->get('text_percent');
		$data['text_amount'] = $this->language->get('text_amount');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_rate'] = $this->language->get('entry_rate');
		$data['entry_type'] = $this->language->get('entry_type');
		$data['entry_seller_group'] = $this->language->get('entry_seller_group');
		$data['entry_geo_zone'] = $this->language->get('entry_geo_zone');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		if (isset($this->error['rate'])) {
			$data['error_rate'] = $this->error['rate'];
		} else {
			$data['error_rate'] = '';
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('commission/commission_rate', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);

		if (!isset($this->request->get['commission_rate_id'])) {
			$data['action'] = $this->url->link('commission/commission_rate/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$data['action'] = $this->url->link('commission/commission_rate/edit', 'token=' . $this->session->data['token'] . '&commission_rate_id=' . $this->request->get['commission_rate_id'] . $url, 'SSL');
		}

		$data['cancel'] = $this->url->link('commission/commission_rate', 'token=' . $this->session->data['token'] . $url, 'SSL');

		if (isset($this->request->get['commission_rate_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$commission_rate_info = $this->model_commission_commission_rate->getcommissionRate($this->request->get['commission_rate_id']);
		}

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($commission_rate_info)) {
			$data['name'] = $commission_rate_info['name'];
		} else {
			$data['name'] = '';
		}

		if (isset($this->request->post['rate'])) {
			$data['rate'] = $this->request->post['rate'];
		} elseif (!empty($commission_rate_info)) {
			$data['rate'] = $commission_rate_info['rate'];
		} else {
			$data['rate'] = '';
		}

		if (isset($this->request->post['type'])) {
			$data['type'] = $this->request->post['type'];
		} elseif (!empty($commission_rate_info)) {
			$data['type'] = $commission_rate_info['type'];
		} else {
			$data['type'] = '';
		}

		if (isset($this->request->post['commission_rate_seller_group'])) {
			$data['commission_rate_seller_group'] = $this->request->post['commission_rate_seller_group'];
		} elseif (isset($this->request->get['commission_rate_id'])) {
			$data['commission_rate_seller_group'] = $this->model_commission_commission_rate->getcommissionRatesellerGroups($this->request->get['commission_rate_id']);
		} else {
			$data['commission_rate_seller_group'] = array($this->config->get('config_seller_group_id'));
		}

		$this->load->model('seller/seller_group');

		$data['seller_groups'] = $this->model_seller_seller_group->getsellerGroups();

		if (isset($this->request->post['geo_zone_id'])) {
			$data['geo_zone_id'] = $this->request->post['geo_zone_id'];
		} elseif (!empty($commission_rate_info)) {
			$data['geo_zone_id'] = $commission_rate_info['geo_zone_id'];
		} else {
			$data['geo_zone_id'] = '';
		}

		$this->load->model('localisation/geo_zone');

		$data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('commission/commission_rate_form.tpl', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'commission/commission_rate')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 32)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		if (!$this->request->post['rate']) {
			$this->error['rate'] = $this->language->get('error_rate');
		}

		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'commission/commission_rate')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		$this->load->model('commission/commission_class');

		foreach ($this->request->post['selected'] as $commission_rate_id) {
			$commission_rule_total = $this->model_commission_commission_class->getTotalcommissionRulesBycommissionRateId($commission_rate_id);

			if ($commission_rule_total) {
				$this->error['warning'] = sprintf($this->language->get('error_commission_rule'), $commission_rule_total);
			}
		}

		return !$this->error;
	}
}
