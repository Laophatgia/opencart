<?php
	$this->language( 'module/themecontrol' );
	$objlang = $this->registry->get('language');
	$megamenu = $helper->renderModule('pavmegamenu');
	$autosearch = $helper->renderModule('pavautosearch');
	$verticalmenu = $helper->renderModule('pavverticalmenu');
	if( isset($_COOKIE[$themeName .'_skin']) && $_COOKIE[$themeName .'_skin'] ){
		$skin = trim($_COOKIE[$themeName .'_skin']);
	}
?>
<header id="header-layout">
	<div class="container">
		<div class="inside">
			<div class="vertical-icon pull-left hidden-xs hidden-sm">
				<?php if(!empty($verticalmenu)) { ?>
                    <?php echo $verticalmenu; ?>
                <?php } ?>
			</div>
			<div class="container">
				<div class="row">
					<!-- logo -->
					<?php if( $logoType=='logo-theme'){ ?>
					<div id="logo-theme" class="logo pull-left">
						<a href="<?php echo $home; ?>">
							<img src="image/catalog/<?php if(isset($skin)) echo $skin."/"; ?>logo_theme.png" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
						</a>
					</div>
					<?php } elseif ($logo) { ?>
					<div id="logo" class="logo pull-left">
						<a href="<?php echo $home; ?>">
							<img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
						</a>
					</div>
					<?php } ?>
					<div class="pull-right content-header">
					<!-- search -->
						<?php
						if (count($autosearch) && !empty($autosearch)) {
						echo $autosearch;
						} else {
						echo $search;
						}
						?>
					</div>
				</div>
				<div class="row">
					<div class=" col-md-offset-2 content-header" style= "padding-top: 4px !important" >
						<!-- menu -->
						<div id="pav-mainnav" class="hidden-xs hidden-sm pull-left">
							
							<?php
							/**
							* Main Menu modules: as default if do not put megamenu, the theme will use categories menu for main menu
							*/
							if (count($megamenu) && !empty($megamenu)) { echo $megamenu;?>
							<?php } elseif ($categories) { ?>
							<nav id="menu" class="navbar navbar-default">
								<div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
									<button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
								</div>
								<div class="collapse navbar-collapse navbar-ex1-collapse">
									<ul class="nav navbar-nav">
										<?php foreach ($categories as $category) { ?>
										<?php if ($category['children']) { ?>
										<li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
										<div class="dropdown-menu">
											<div class="dropdown-inner">
												<?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
												<ul class="list-unstyled">
													<?php foreach ($children as $child) { ?>
													<li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
													<?php } ?>
												</ul>
												<?php } ?>
											</div>
											<a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
										</li>
										<?php } else { ?>
										<li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
										<?php } ?>
										<?php } ?>
									</ul>
								</div>
							</nav>
							<?php } ?>
						</div>
					</div>
				</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="bottom-offcanvas">
		<div class="container"><button data-toggle="offcanvas" class="btn btn-primary visible-xs visible-sm" type="button"><i class="fa fa-bars"></i></button></div>
	</div>
</header>