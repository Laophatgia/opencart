<?php 
    
    $mode = 'horizontal';
    $cols = array( 'default' => array(5,7),
                   'horizontal' => array(4,7)
    ); 
    $cols = $cols[$mode];     
?>

<div class="product-info">
    <div class="row">
    <div class="product-info-bg">
    <?php echo $mode; require( ThemeControlHelper::getLayoutPath( 'common/detail/'.$mode.'.tpl' ) );  ?> 
   
	<div class="col-xs-12 col-sm-<?php echo $cols[1]; ?> col-md-<?php echo $cols[1]; ?> col-lg-<?php echo $cols[1]; ?>">
		<h1 class="title-product"><?php echo $heading_title; ?></h1>

        <?php if ($review_status) { ?>
            <div class="rating">
                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                        <?php if ($rating < $i) { ?>
                            <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                        <?php } else { ?>
                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i></span>
                        <?php } ?>
                    <?php } ?>
                    <a href="#review-form" class="popup-with-form" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;" ><?php echo $reviews; ?></a> / <a href="#review-form"  class="popup-with-form" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;" ><?php echo $text_write; ?></a>

            </div>
        <?php } ?>

		    <blockquote> 
            	<?php if( isset($short_description) ){ ?>	
            		 <p > <?php echo $short_description;?> </p>
            	<?php } ?> 
            </blockquote>

        <blockquote class="border-success">
            <ul class="list-unstyled">
                <?php if ($manufacturer) { ?>
                    <li><b><?php echo $text_manufacturer; ?></b> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
                <?php } ?>
                <li><b><?php echo $text_model; ?></b> <?php echo $model; ?></li>
            </ul>
          <?php if ($tags) { ?>
          <p><?php echo "<b>".$text_tags."</b>"; ?>
            <?php for ($i = 0; $i < count($tags); $i++) { ?>
            <?php if ($i < (count($tags) - 1)) { ?>
            <a href="<?php echo $tags[$i]['href']; ?>"><?php echo trim($tags[$i]['tag']); ?></a>,
            <?php } else { ?>
            <a href="<?php echo $tags[$i]['href']; ?>"><?php echo trim($tags[$i]['tag']); ?></a>
            <?php } ?>
            <?php } ?>
          </p>
          <?php } ?>
        </blockquote>

        <hr>
        
       
        <div class="clearfix"></div>
         <hr>

        <!-- AddThis Button BEGIN -->
        <div class="addthis_toolbox addthis_default_style"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div>
        <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script> 
        <!-- AddThis Button END --> 
        
	</div>
    </div><!-- End div bg -->
</div>

<div class="clearfix box-product-infomation">
    <ul class="nav nav-style">
        <li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
        <?php if ($attribute_groups) { ?>
            <li><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
        <?php } ?>
        <?php if ($review_status) { ?>
            <li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
        <?php } ?>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="tab-description"><?php echo $description; ?></div>
        <?php if ($attribute_groups) { ?>
            <div class="tab-pane" id="tab-specification">
                <table class="table table-bordered">
                    <?php foreach ($attribute_groups as $attribute_group) { ?>
                        <thead>
                            <tr>
                                <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                                <tr>
                                    <td><?php echo $attribute['name']; ?></td>
                                    <td><?php echo $attribute['text']; ?></td>
                                </tr>
                            <?php } ?>
                        </tbody>
                    <?php } ?>
                </table>
            </div>
        <?php } ?>
        <?php if ($review_status) { ?>

            <div class="tab-pane" id="tab-review">

                <div id="review"></div>
                <p> <a href="#review-form"  class="popup-with-form btn btn-sm btn-danger" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;" ><?php echo $text_write; ?></a></p>

               <div class="hide"> <div id="review-form" class="panel review-form-width"><div class="panel-body">
                <form class="form-horizontal ">
                 
                    <h2><?php echo $text_write; ?></h2>
                    <div class="form-group required">
                        <div class="col-sm-12">
                            <label class="control-label" for="input-name"> <?php echo $entry_name; ?></label>
                            <input type="text" name="name" value="" id="input-name" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group required">
                        <div class="col-sm-12">
                            <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                            <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                            <div class="help-block"><?php echo $text_note; ?></div>
                        </div>
                    </div>
                    <div class="form-group required">
                        <div class="col-sm-12">
                            <label class="control-label"><?php echo $entry_rating; ?></label>
                            &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                            <input type="radio" name="rating" value="1" />
                            &nbsp;
                            <input type="radio" name="rating" value="2" />
                            &nbsp;
                            <input type="radio" name="rating" value="3" />
                            &nbsp;
                            <input type="radio" name="rating" value="4" />
                            &nbsp;
                            <input type="radio" name="rating" value="5" />
                            &nbsp;<?php echo $entry_good; ?></div>
                    </div>
                    <div class="form-group required">
                        <div class="col-sm-12">
                            <label class="control-label" for="input-captcha"><?php echo $entry_captcha; ?></label>
                            <input type="text" name="captcha" value="" id="input-captcha" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-12"> <img src="index.php?route=tool/captcha" alt="" id="captcha" /> </div>
                    </div>
                    <div class="buttons">
                        <div class="pull-right">
                            <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                        </div>
                    </div>
                </form></div></div></div>

            </div>
        <?php } ?>
    </div>
</div>
</div>

