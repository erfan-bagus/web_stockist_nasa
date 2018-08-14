<!DOCTYPE html>
<html class="no-js css-menubar" lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
	<meta name="description" content="bootstrap material admin template">
	<meta name="author" content="">

	<title>Blank | Remark Material Admin Template</title>

	<link rel="apple-touch-icon" href="{{assets('apple-touch-icon.png','images')}}">
	<link rel="shortcut icon" href="{{assets('favicon.ico','images')}}">

	<!-- Stylesheets -->
	<link rel="stylesheet" href="{{assets('bootstrap.min.css','global/css')}}">
	<link rel="stylesheet" href="{{assets('bootstrap-extend.min.css','global/css')}}">
	<link rel="stylesheet" href="{{assets('site.min.css','css')}}">

	<!-- Plugins -->
	<link rel="stylesheet" href="{{assets('animsition.css','global/vendor/animsition')}}">
	<link rel="stylesheet" href="{{assets('asScrollable.css','global/vendor/asscrollable')}}">
	<link rel="stylesheet" href="{{assets('switchery.css','global/vendor/switchery')}}">
	<link rel="stylesheet" href="{{assets('introjs.css','global/vendor/intro-js')}}">
	<link rel="stylesheet" href="{{assets('slidePanel.css','global/vendor/slidepanel')}}">
	<link rel="stylesheet" href="{{assets('jquery-mmenu.css','global/vendor/jquery-mmenu')}}">
	<link rel="stylesheet" href="{{assets('flag-icon.css','global/vendor/flag-icon-css')}}">
	<link rel="stylesheet" href="{{assets('waves.css','global/vendor/waves')}}">


	<!-- Fonts -->
	<link rel="stylesheet" href="{{assets('material-design.min.css','global/fonts/material-design')}}">
	<link rel="stylesheet" href="{{assets('brand-icons.min.css','global/fonts/brand-icons')}}">
	<link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,300italic'>

	<!--[if lt IE 9]>
	<script src="{{assets('html5shiv.min.js','global/vendor/html5shiv')}}"></script>
	<![endif]-->

	<!--[if lt IE 10]>
	<script src="{{assets('media.match.min.js','global/vendor/media-match')}}"></script>
	<script src="{{assets('respond.min.js','global/vendor/respond')}}"></script>
	<![endif]-->

	<!-- Scripts -->
	<script src="{{assets('breakpoints.js','global/vendor/breakpoints')}}"></script>
	<script>
		Breakpoints();
	</script>
</head>
<body class="animsition site-navbar-small ">
<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
	your browser</a> to improve your experience.</p>
<![endif]-->

{{--navbar--}}
@include('partrials.navbar')
{{--navbar--}}

{{--sidebar--}}
@include('partrials.sidebar')
{{--sidebar--}}

{{--logomenubar--}}
@include('partrials.logomenubar')
{{--logomenubar--}}

{{--content--}}
<div class="page">
	<div class="page-content">
		@yield('content')
	</div>
</div>
{{--content--}}

{{--footer--}}
@include('partrials.footer')
{{--footer--}}
<!-- Core  -->
<script src="{{assets('babel-external-helpers.js','global/vendor/babel-external-helpers')}}"></script>
<script src="{{assets('jquery.js','global/vendor/jquery')}}"></script>
<script src="{{assets('popper.min.js','global/vendor/popper-js/umd')}}"></script>
<script src="{{assets('bootstrap.js','global/vendor/bootstrap')}}"></script>
<script src="{{assets('animsition.js','global/vendor/animsition')}}"></script>
<script src="{{assets('jquery.mousewheel.js','global/vendor/mousewheel')}}"></script>
<script src="{{assets('jquery-asScrollbar.js','global/vendor/asscrollbar')}}"></script>
<script src="{{assets('jquery-asScrollable.js','global/vendor/asscrollable')}}"></script>
<script src="{{assets('waves.js','global/vendor/waves')}}"></script>

<!-- Plugins -->
<script src="{{assets('jquery.mmenu.min.all.js','global/vendor/jquery-mmenu')}}"></script>
<script src="{{assets('switchery.js','global/vendor/switchery')}}"></script>
<script src="{{assets('intro.js','global/vendor/intro-js')}}"></script>
<script src="{{assets('screenfull.js','global/vendor/screenfull')}}"></script>
<script src="{{assets('jquery-slidePanel.js','global/vendor/slidepanel')}}"></script>

<!-- Scripts -->
<script src="{{assets('Component.js','global/js')}}"></script>
<script src="{{assets('Plugin.js','global/js')}}"></script>
<script src="{{assets('Base.js','global/js')}}"></script>
<script src="{{assets('Config.js','global/js')}}"></script>

<script src="{{assets('Menubar.js','js/Section')}}"></script>
<script src="{{assets('Sidebar.js','js/Section')}}"></script>
<script src="{{assets('PageAside.js','js/Section')}}"></script>
<script src="{{assets('GridMenu.js','js/Section')}}"></script>

<!-- Config -->
<script src="{{assets('colors.js','global/js/config')}}"></script>
<script src="{{assets('tour.js','js/config')}}"></script>
<script>Config.set('assets', 'assets');</script>

<!-- Page -->
<script src="{{assets('Site.js','js')}}"></script>
<script src="{{assets('asscrollable.js','global/js/Plugin')}}"></script>
<script src="{{assets('slidepanel.js','global/js/Plugin')}}"></script>
<script src="{{assets('switchery.js','global/js/Plugin')}}"></script>

<script>
	(function (document, window, $) {
		'use strict';
		var Site = window.Site;
		$(document).ready(function () {
			Site.run();
		});
	})(document, window, jQuery);
</script>

</body>
</html>
