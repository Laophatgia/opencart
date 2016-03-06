<?php $objlang = $this->registry->get('language');  $ourl = $this->registry->get('url');   ?>



<div class="product-block item-dual" itemtype="http://schema.org/Product" itemscope>

  

  <div class="block-img">
    <?php if ($product['thumb']) {    ?>
      
      <div class="image">
        <a class="img" itemprop="url" title="<?php echo $product['name']; ?>" href="<?php echo $product['href']; ?>">
          <img class="img-responsive" itemprop="image" src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
        </a>
      </div>
    <?php } ?>

    <div class="action">
      <div class="compare">     
        <button class="btn btn-default dark" type="button" data-toggle="tooltip" data-placement="right" title="<?php echo $objlang->get("button_compare"); ?>" onclick="compare.addcompare('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button> 
      </div>  
      <div class="quickview">
        <a class="btn btn-default iframe-link dark" data-toggle="tooltip" data-placement="right" href="<?php echo $ourl->link('themecontrol/product','product_id='.$product['product_id']);?>"  title="<?php echo $objlang->get('quick_view'); ?>" ><i class="fa fa-eye"></i></a>
      </div>
    </div>    
  </div>
         
  <div class="product-meta">      
    <h3 class="name" itemprop="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
        <?php if( isset($product['description']) ){ ?> 
    <p class="description" itemprop="description"><?php echo utf8_substr( strip_tags($product['description']),0,220);?>...</p>
    <?php } ?> 

    <blockquote> 
	<?php if( isset($product['short_description']) ){ ?>	
		 <p > <?php echo $product['short_description'];?> </p>
	<?php } ?> 
    </blockquote>
  </div>  
</div>





