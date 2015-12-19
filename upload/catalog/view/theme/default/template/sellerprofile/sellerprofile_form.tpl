<?php echo $header; ?><?php echo $column_left; ?>
<div class="container">
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
         <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
     <?php if ($error_warning_product_limit) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning_product_limit; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-user"></i> <?php echo $text_seller_profile; ?></h3>
      </div>
      <div class="panel-body">
	
           <ul class="nav nav-tabs">
			  	   <?php if (!empty($is_seller)) { ?>
            <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
           <li><a href="#tab-more_details" data-toggle="tab"><?php echo $tab_more_details; ?></a></li>
			<li><a href="#tab-badge" data-toggle="tab"><?php echo $tab_badge; ?></a></li>
			<li><a href="#tab-sellerproduct" data-toggle="tab"><?php echo $tab_sellerproduct; ?></a></li>
            <li><a href="#tab-bankaccount" data-toggle="tab"><?php echo $tab_bankaccount; ?></a></li>
            
               <?php } ?>
               <li><a href="#tab-transaction" data-toggle="tab"><?php echo $tab_transaction; ?></a></li>
               <li><a href="#tab-history" data-toggle="tab"><?php echo $tab_history; ?></a></li>
            <li <?php if (empty($is_seller)) { echo 'class="active"'; } ?>><a href="#tab-request_membership" data-toggle="tab"><?php echo $tab_request_membership; ?></a></li>
            
          </ul>
          <div class="tab-content">
			  <?php if (!empty($is_seller)) { ?>
            <div class="tab-pane active" id="tab-general">
              <div class="row">
                <div class="col-sm-2">
                </div>
                <div class="col-sm-11">
                  <div class="tab-content">
                    <div class="tab-pane active" id="tab-seller">
				 <div class="col-md-4">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-user"></i> <?php echo $text_seller_detail; ?></h3>
          </div>
          <table class="table">
            <tbody>
              <tr>
                <td style="width: 1%;"><button data-toggle="tooltip" title="<?php echo $entry_name; ?>" class="btn btn-info btn-xs"><i class="fa fa-user fa-fw"></i></button></td>
                <td><?php echo $firstname.' '.$lastname; ?></a></td>
              </tr>
                 <tr>
                <td style="width: 1%;"><button data-toggle="tooltip" title="<?php echo $entry_seller_group; ?>" class="btn btn-info btn-xs"><i class="fa fa-users fa-fw"></i></button></td>
                <td><?php echo $seller_group; ?></a></td>
              </tr>
               <tr>
                <td><button data-toggle="tooltip" title="<?php echo $entry_date_created; ?>" class="btn btn-info btn-xs"><i class="fa fa-calendar fa-fw"></i></button></td>
                <td><?php echo $date ; ?></td>
              </tr>
               <tr>
                <td><button data-toggle="tooltip" title="<?php echo $entry_date_end; ?>" class="btn btn-info btn-xs"><i class="fa fa-calendar fa-fw"></i></button></td>
                <td><?php echo $date_end; ?></td>
              </tr>
              
              <tr>
                <td><button data-toggle="tooltip" title="<?php echo $entry_email; ?>" class="btn btn-info btn-xs"><i class="fa fa-envelope-o fa-fw"></i></button></td>
                <td><?php echo $email; ?></td>
              </tr>
              <tr>
                <td><button data-toggle="tooltip" title="<?php echo $entry_telephone; ?>" class="btn btn-info btn-xs"><i class="fa fa-phone fa-fw"></i></button></td>
                <td><?php echo $telephone; ?></td>
              </tr>
              
            </tbody>
          </table>
        </div>
      </div>
      
      			 <div class="col-md-4">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-users"></i> <?php echo $text_seller_group_detail; ?></h3>
          </div>
          <table class="table">
            <tbody>
				            
			<?php foreach ($seller_group_info as $seller_group_info) { ?>
				  <tr> 
                <td><button data-toggle="tooltip" title="<?php echo $entry_seller_group_commission; ?>" class="btn btn-info btn-xs"><i class="fa fa-sitemap fa-fw"></i></button></td>
                <td><?php echo $seller_group_info['commission_name']; ?></td>
                
              </tr>
             	  <tr> 
                <td><button data-toggle="tooltip" title="<?php echo $entry_seller_group_commission_rate; ?>" class="btn btn-info btn-xs"><i class="fa fa-credit-card fa-fw"></i></button></td>
                <td><?php echo $seller_group_info['rate']; ?></td>
                
              </tr>
              <tr> 
                <td><button data-toggle="tooltip" title="<?php echo $entry_seller_group_subscription_price; ?>" class="btn btn-info btn-xs"><i class="fa fa-usd fa-fw"></i></button></td>
                <td><?php echo $seller_group_subscription_price; ?></td>
                
              </tr> 
              <tr> 
                <td><button data-toggle="tooltip" title="<?php echo $entry_seller_product_total; ?>" class="btn btn-info btn-xs"><i class="fa fa-battery-quarter fa-fw"></i></button></td>
                <td><?php echo $seller_product_total; ?></td>
                
              </tr> 
                	  <tr> 
                <td><button data-toggle="tooltip" title="<?php echo $entry_seller_group_limit; ?>" class="btn btn-info btn-xs"><i class="fa fa-battery-full fa-fw"></i></button></td>
                <td><?php echo $seller_group_limit; ?></td>
                
              </tr> 
                <tr> 
                <td><button data-toggle="tooltip" title="<?php echo $entry_seller_product_left; ?>" class="btn btn-info btn-xs"><i class="fa fa-exclamation-triangle fa-fw"></i></button></td>
                <td>
                
                 <div class="progress">
     <div class="progress-bar active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:<?php echo ($seller_product_total / $seller_group_limit)*100;?>%">
      <?php echo ($seller_group_limit - $seller_product_total); ?>
    </div>
  </div>
                </td>
                
              </tr> 
              
            <?php } ?>
   
            </tbody>
          </table>
        </div>
      </div>
      
          				    
                       
       
		
      </div>
                  </div>
                </div>
              </div>
            </div>
          
            				<div class="tab-pane" id="tab-more_details">
             			  
        <div class="col-md-10">
      
			   <table class="table">
            <tbody>
              <tr>  
				
                			  
                
               
                  <a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                  <input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" />
                  <button type="button" id="button-seller_add_image" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i> <?php echo $button_save; ?></button>
                  <button type="button" id="button-seller_delete_image" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-danger"><i class="fa fa-times"></i> <?php echo $button_remove; ?></button>
            
              
              </tr>
			       </tbody>
          </table>
           
      
        
  
  
        <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-facebook"><?php echo $entry_facebook; ?></label>
                  
                    <div class="input-group">
                      <input type="text" name="facebook" placeholder="http://www.facebook.com/youraccount" value="<?php echo $facebook; ?>" id="input-facebook" class="form-control" />
                      <span class="input-group-btn">
                      <button type="button" id="button-facebook" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_save; ?></button>
                      </span></div>
                  
                </div>
                
                    <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-twitter"><?php echo $entry_twitter; ?></label>
                  
                    <div class="input-group">
                      <input type="text" name="twitter" placeholder="http://twitter.com/youraccount" value="<?php echo $twitter; ?>" id="input-twitter" class="form-control" />
                      <span class="input-group-btn">
                      <button type="button" id="button-twitter" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_save; ?></button>
                      </span></div>
                 
                </div>
    
                
                     <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-googleplus"><?php echo $entry_googleplus; ?></label>
                 
                    <div class="input-group">
                      <input type="text" name="googleplus" placeholder="http://plus.google.com/youraccount" value="<?php echo $googleplus; ?>" id="input-googleplus" class="form-control" />
                      <span class="input-group-btn">
                      <button type="button" id="button-googleplus" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_save; ?></button>
                      </span></div>
               
                </div>
   
               
                     <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-instagram"><?php echo $entry_instagram; ?></label>
                 
                    <div class="input-group">
                      <input type="text" name="instagram" placeholder="http://www.instagram.com/youraccount" value="<?php echo $instagram; ?>" id="input-instagram" class="form-control" />
                      <span class="input-group-btn">
                      <button type="button" id="button-instagram" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_save; ?></button>
                      </span></div>
                 
                </div>
   
                

      </div>
     
      
			
   

            </div>
           
	
				<div class="tab-pane" id="tab-badge">
              <div id="badge"></div>
              <br />

            </div>
            				<div class="tab-pane" id="tab-bankaccount">
              <div id="bankaccount"></div>
              <br />

            </div>
     	<div class="tab-pane" id="tab-sellerproduct">
              <div id="sellerproduct"></div>
              <br />

            </div>
             <?php } ?>
                     <div class="tab-pane" id="tab-transaction">
              <div id="transaction"></div>
              <br />
           </div>
     
                   <div class="tab-pane" id="tab-history">
					     <div class="text-right">
                <button id="button-history" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><i class="fa fa-refresh"></i> <?php echo $button_history_add; ?></button>
              </div>
              <div id="history"></div>
              <br />
                
                </div>
       
            <div <?php if (empty($is_seller)) { echo 'class="tab-pane active"'; }else{echo 'class="tab-pane"';} ?> id="tab-request_membership">
              <div id="request_membership"></div>
              <br />
              <div class="form-group">
			
      <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td style="width: 1px;" class="text-center"></td>
                  <td class="text-left"><?php echo $column_name; ?></td>
                    <td class="text-center"><?php echo $column_product_limit; ?></td>
                      <td class="text-center"><?php echo $column_subscription_price; ?></td>
                    
                  <td class="text-center"><?php echo $column_commission_rate; ?></td>
                       <td class="text-center"><?php echo $column_subscription_duration; ?></td>
                        <td class="text-center"><?php echo $column_categories; ?></td>
   <td class="text-center"><?php echo $column_seller_group_description; ?></td>
  
                </tr>
              </thead>
              <tbody>
                <?php if ($seller_groups) { ?> 
                <?php foreach ($seller_groups as $seller_group) { ?>
                <tr>
                  <td class="text-center">
                    <input type="checkbox" name="selected" value="<?php echo $seller_group['seller_group_id']; ?>" id="<?php echo $seller_group['name']; ?>" />
                    
                   </td>
                  <td class="text-left"><?php echo $seller_group['name']; ?>
                  
                  <?php if (in_array($seller_group['seller_group_id'], $seller_group_id)) { ?>
					 (   <i class="fa fa-check-circle fa-2x" style="color: green;"></i>   )
					  <?php } ?>  
					 
                  </td>
                  <td class="text-center"><?php echo $seller_group['product_limit']; ?></td>
                  <td class="text-center"><?php echo $seller_group['subscription_price']; ?></td>
              
                 
                   <td class="text-center"><?php echo $seller_group['seller_group_commission_rate']; ?></td>
                     <?php if ($seller_group['subscription_duration']) { ?> 
                    <td class="text-center"><?php echo $seller_group['text_subscription_duration']; ?></td>
                <?php } else { ?>
					<td class="text-center"><?php echo $text_unlimited; ?></td>
					<?php } ?>
				
						 
							
             
              
              <td class="left">
              <div class="scrollbox scrollbox<?php echo '-' .  $seller_group['seller_group_id'];?>" style="border: 1px solid #CCCCCC; width: 350px; height: 100px; background: #FFFFFF; overflow-y: scroll;">
                      <?php foreach ($seller_categories as $category) { ?>
              <div class="checkbox">
                <label>
                  <?php if (in_array($category['category_id'], $seller_group['categories'])) { ?>
                  <input type="checkbox" name="seller_category[]" value="<?php echo $category['category_id']; ?>" checked="checked" />
               
                  <?php echo $category['name']; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="seller_category[]" value="<?php echo $category['category_id']; ?>" />
                  
                  <?php echo $category['name']; ?>
                  
                  <?php } ?>
                </label>
              </div>
              <?php } ?>
             </div>
                  </td>
              
						 
						 
					
<td class="text-center"><?php echo $seller_group['description']; ?></td>

                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="4"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
      
                          </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-request_membership-description"><?php echo $entry_description; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="description" value="" placeholder="<?php echo $entry_description; ?>" id="input-request_membership-description" class="form-control" />
                </div>
              </div>
                 
          <div class="pull-right" style="margin-top: 15px;"><?php echo $text_agree; ?>

            <input type="checkbox" name="agree" value="1" />

            &nbsp;
                <button type="button" id="button-request_membership" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i> <?php echo $button_request_membership_add; ?></button>
           
          </div>

            </div>
          
             </div>

      </div>
    </div>
  </div>

 <script type="text/javascript"><!--
$('#badge').delegate('.pagination a', 'click', function(e) {
	e.preventDefault();

	$('#badge').load(this.href);
});

$('#badge').load('index.php?route=sellerprofile/sellerprofile/badge&seller_id=<?php echo $seller_id; ?>');

$('#button-badge').on('click', function(e) {
  e.preventDefault();

	$.ajax({
		url: 'index.php?route=sellerprofile/sellerprofile/badge&seller_id=<?php echo $seller_id; ?>',
		type: 'post',
		dataType: 'html',
		data: 'comment=' + encodeURIComponent($('#tab-badge textarea[name=\'comment\']').val()),
		beforeSend: function() {
			$('#button-badge').button('loading');
		},
		complete: function() {
			$('#button-badge').button('reset');
		},
		success: function(html) {
			$('.alert').remove();

			$('#badge').html(html);

			$('#tab-badge textarea[name=\'comment\']').val('');
		}
	});
});
//--></script> 
  <script type="text/javascript"><!--
$('#sellerproduct').delegate('.pagination a', 'click', function(e) {
	e.preventDefault();

	$('#sellerproduct').load(this.href);
});

$('#sellerproduct').load('index.php?route=sellerprofile/sellerprofile/sellerproduct&seller_id=<?php echo $seller_id; ?>');

$('#button-sellerproduct').on('click', function(e) {
  e.preventDefault();

	$.ajax({
		url: 'index.php?route=sellerprofile/sellerprofile/sellerproduct&seller_id=<?php echo $seller_id; ?>',
		type: 'post',
		dataType: 'html',
		data: 'comment=' + encodeURIComponent($('#tab-sellerproduct textarea[name=\'comment\']').val()),
		beforeSend: function() {
			$('#button-sellerproduct').button('loading');
		},
		complete: function() {
			$('#button-sellerproduct').button('reset');
		},
		success: function(html) {
			$('.alert').remove();

			$('#sellerproduct').html(html);

			$('#tab-sellerproduct textarea[name=\'comment\']').val('');
		}
	});
});
//--></script>
  <script type="text/javascript"><!--
$('#bankaccount').load('index.php?route=bankaccount/bankaccount&profile=<?php echo $seller_id; ?>');
$('#history').load('index.php?route=sellerprofile/sellerprofile/history&seller_id=<?php echo $seller_id; ?>');

$('#button-history').on('click', function(e) {
  e.preventDefault();

	$.ajax({
		url: 'index.php?route=sellerprofile/sellerprofile/history&seller_id=<?php echo $seller_id; ?>',
		type: 'post',
		dataType: 'html',
		data: 'comment=' + encodeURIComponent($('#tab-history textarea[name=\'comment\']').val()),
		beforeSend: function() {
			$('#button-history').button('loading');
		},
		complete: function() {
			$('#button-history').button('reset');
		},
		success: function(html) {
			//$('.alert').remove();

			$('#history').html(html);

			$('#tab-history textarea[name=\'comment\']').val('');
		}
	});
});
//--></script> 
  <script type="text/javascript"><!--
$('#transaction').delegate('.pagination a', 'click', function(e) {
	e.preventDefault();

	$('#transaction').load(this.href);
});

$('#transaction').load('index.php?route=sellerprofile/sellerprofile/transaction&seller_id=<?php echo $seller_id; ?>');

$('#button-transaction').on('click', function(e) {
  e.preventDefault();

  $.ajax({
		url: 'index.php?route=sellerprofile/sellerprofile/transaction&seller_id=<?php echo $seller_id; ?>',
		type: 'post',
		dataType: 'html',
		data: 'seller_group_id=' + encodeURIComponent($('#tab-transaction select[name=\'seller_group_id\']').val()) + '&amount=' + encodeURIComponent($('#tab-transaction input[name=\'amount\']').val()),
		beforeSend: function() {
			$('#button-transaction').button('loading');
		},
		complete: function() {
			$('#button-transaction').button('reset');
		},
		success: function(html) {
			$('.alert').remove();

			$('#transaction').html(html);

			$('#tab-transaction input[name=\'amount\']').val('');
			$('#tab-transaction input[name=\'description\']').val('');
		}
	});
});
//--></script> 
  <script type="text/javascript"><!--
$('#request_membership').delegate('.pagination a', 'click', function(e) {
	e.preventDefault();

	$('#request_membership').load(this.href);
});

$('#request_membership').load('index.php?route=sellerprofile/sellerprofile/request_membership&seller_id=<?php echo $seller_id; ?>');

$('#button-request_membership').on('click', function(e) {
	e.preventDefault();
if($('#tab-request_membership input[name=\'agree\']').prop('checked')){
	var seller_group_id = $('#tab-request_membership input[name=\'selected\']:checkbox:checked').val();
	$.ajax({
		url: 'index.php?route=sellerprofile/sellerprofile/request_membership&seller_id=<?php echo $seller_id; ?>',
		type: 'POST',
		dataType: 'html',
		data: $('#tab-request_membership .scrollbox-'+seller_group_id+' input[name=\'seller_category[]\']').serialize() +'&seller_group_name=' + encodeURIComponent($('#tab-request_membership input[name=\'selected\']:checkbox:checked').attr("id")) + '&description=' + encodeURIComponent($('#tab-request_membership input[name=\'description\']').val())+ '&seller_group_id=' + encodeURIComponent($('#tab-request_membership input[name=\'selected\']:checkbox:checked').val()),
		beforeSend: function() {
			$('#button-request_membership').button('loading');
		},
		complete: function() {
			$('#button-request_membership').button('reset');
		},
		success: function(html) {
			//$('.alert').remove();
			$('#request_membership').load('index.php?route=sellerprofile/sellerprofile/request_membership&seller_id=<?php echo $seller_id; ?>');


			$('#request_membership').html(html);

			$('#tab-request_membership input[name=\'points\']').val('');
			$('#tab-request_membership input[name=\'description\']').val('');
		}
	});
	

	
}else{
	var text_seller_agree = '<?php echo $text_seller_agree; ?>';
	
	$('#request_membership').prepend('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> '  + text_seller_agree + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
	}
});

//--></script>
 <script type="text/javascript"><!--
$('#button-request_membership').attr("disabled","disabled"); 
// the selector will match all input controls of type :checkbox
// and attach a click event handler 
$(".text-center input:checkbox").on('click', function() {
  // in the handler, 'this' refers to the box clicked on
  var $box = $(this);
  if ($box.is(":checked")) {
	  $('#button-request_membership').removeAttr('disabled');
    // the name of the box is retrieved using the .attr() method
    // as it is assumed and expected to be immutable
    var group = "input:checkbox[name='" + $box.attr("name") + "']";
    // the checked state of the group/box on the other hand will change
    // and the current value is retrieved using .prop() method
    $(group).prop("checked", false);
    $box.prop("checked", true);
  } else {
	$('#button-request_membership').attr("disabled","disabled");   
    $box.prop("checked", false);
  }
});

// Image Manager
	$(document).delegate('a[data-toggle=\'image\']', 'click', function(e) {
		e.preventDefault();
	
		var element = this;
	
		$(element).popover({
			html: true,
			placement: 'right',
			trigger: 'manual',
			content: function() {
				return '<button type="button" id="button-image" class="btn btn-primary"><i class="fa fa-pencil"></i></button> <button type="button" id="button-clear" class="btn btn-danger"><i class="fa fa-trash-o"></i></button>';
			}
		});
	
		$(element).popover('toggle');		
	
		$('#button-image').on('click', function() {
			$('#modal-image').remove();
	
			$.ajax({
				url: 'index.php?route=sellerproduct/filemanager&token=' + getURLVar('token') + '&target=' + $(element).parent().find('input').attr('id') + '&thumb=' + $(element).attr('id'),
				dataType: 'html',
				beforeSend: function() {
					$('#button-image i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
					$('#button-image').prop('disabled', true);
				},
				complete: function() {
					$('#button-image i').replaceWith('<i class="fa fa-upload"></i>');
					$('#button-image').prop('disabled', false);
				},
				success: function(html) {
					$('body').append('<div id="modal-image" class="modal">' + html + '</div>');
	
					$('#modal-image').modal('show');
				}
			});
	
			$(element).popover('hide');
		});
	
		$('#button-clear').on('click', function() {
			$(element).find('img').attr('src', $(element).find('img').attr('data-placeholder'));
			
			$(element).parent().find('input').attr('value', '');
	
			$(element).popover('hide');
		});
	});

$(document).delegate('#button-seller_add_image', 'click', function() {
	$.ajax({
		url: 'index.php?route=sellerprofile/sellerprofile/seller_add_image&seller_id=<?php echo $seller_id; ?>',
		dataType: 'json',
		data: 'seller_image=' + encodeURIComponent($('#tab-more_details input[name=\'image\']').val()),
		beforeSend: function() {
			$('#button-seller_add_image').button('loading');
		},
		complete: function() {
						$('#button-seller_add_image').button('reset');

			$('#button-seller_add_image').addClass('btn-success');
			$('#button-seller_add_image').removeClass('btn-primary');
		
			
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['seller_add_image_no']) {
				$('#seller_add_image').html(json['seller_add_image_no']);

				$('#button-seller_add_image').replaceWith('<button disabled="disabled" class="btn btn-success btn-xs"><i class="fa fa-cog"></i></button>');
				
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});


$(document).delegate('#button-seller_delete_image', 'click', function() {
	$.ajax({
		url: 'index.php?route=sellerprofile/sellerprofile/seller_delete_image&seller_id=<?php echo $seller_id; ?>',
		dataType: 'json',
		data: 'seller_image=' + encodeURIComponent($('#tab-more_details input[name=\'image\']').val()),
		beforeSend: function() {
			$('#button-seller_delete_image').button('loading');
		},
		complete: function() {
						$('#button-seller_delete_image').button('reset');

			$('#button-seller_delete_image').addClass('btn-success');
			$('#button-seller_delete_image').removeClass('btn-primary');
		
			$('#thumb-image').find('img').attr('src', $('#thumb-image').find('img').attr('data-placeholder'));
			
			
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['seller_delete_image_no']) {
				$('#seller_delete_image').html(json['seller_delete_image_no']);

				$('#button-seller_delete_image').replaceWith('<button disabled="disabled" class="btn btn-success btn-xs"><i class="fa fa-cog"></i></button>');
				
				
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$(document).delegate('#button-facebook', 'click', function() {
	$.ajax({
		url: 'index.php?route=sellerprofile/sellerprofile/facebook&seller_id=<?php echo $seller_id; ?>',
		dataType: 'json',
		data: 'seller_facebook=' + encodeURIComponent($('#tab-more_details input[name=\'facebook\']').val()),
		beforeSend: function() {
			$('#button-facebook').button('loading');
		},
		complete: function() {
						$('#button-facebook').button('reset');

			$('#button-facebook').addClass('btn-success');
			$('#button-facebook').removeClass('btn-primary');
		
			
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['facebook_no']) {
				$('#facebook').html(json['facebook_no']);

				$('#button-facebook').replaceWith('<button disabled="disabled" class="btn btn-success btn-xs"><i class="fa fa-cog"></i></button>');
				
				
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});


$(document).delegate('#button-twitter', 'click', function() {
	$.ajax({
		url: 'index.php?route=sellerprofile/sellerprofile/twitter&seller_id=<?php echo $seller_id; ?>',
		dataType: 'json',
		data: 'seller_twitter=' + encodeURIComponent($('#tab-more_details input[name=\'twitter\']').val()),
		beforeSend: function() {
			$('#button-twitter').button('loading');
		},
		complete: function() {
						$('#button-twitter').button('reset');

			$('#button-twitter').addClass('btn-success');
			$('#button-twitter').removeClass('btn-primary');
		
			
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['twitter_no']) {
				$('#twitter').html(json['twitter_no']);

				$('#button-twitter').replaceWith('<button disabled="disabled" class="btn btn-success btn-xs"><i class="fa fa-cog"></i></button>');
				
				
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});


$(document).delegate('#button-googleplus', 'click', function() {
	$.ajax({
		url: 'index.php?route=sellerprofile/sellerprofile/googleplus&seller_id=<?php echo $seller_id; ?>',
		dataType: 'json',
		data: 'seller_googleplus=' + encodeURIComponent($('#tab-more_details input[name=\'googleplus\']').val()),
		beforeSend: function() {
			$('#button-googleplus').button('loading');
		},
		complete: function() {
						$('#button-googleplus').button('reset');

			$('#button-googleplus').addClass('btn-success');
			$('#button-googleplus').removeClass('btn-primary');
		
			
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['googleplus_no']) {
				$('#googleplus').html(json['googleplus_no']);

				$('#button-googleplus').replaceWith('<button disabled="disabled" class="btn btn-success btn-xs"><i class="fa fa-cog"></i></button>');
				
				
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});


$(document).delegate('#button-instagram', 'click', function() {
	$.ajax({
		url: 'index.php?route=sellerprofile/sellerprofile/instagram&seller_id=<?php echo $seller_id; ?>',
		dataType: 'json',
		data: 'seller_instagram=' + encodeURIComponent($('#tab-more_details input[name=\'instagram\']').val()),
		beforeSend: function() {
			$('#button-instagram').button('loading');
		},
		complete: function() {
						$('#button-instagram').button('reset');

			$('#button-instagram').addClass('btn-success');
			$('#button-instagram').removeClass('btn-primary');
		
			
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['instagram_no']) {
				$('#instagram').html(json['instagram_no']);

				$('#button-instagram').replaceWith('<button disabled="disabled" class="btn btn-success btn-xs"><i class="fa fa-cog"></i></button>');
				
				
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});
//--></script>
</div></div>
<?php echo $footer; ?>
