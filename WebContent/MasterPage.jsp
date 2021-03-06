<%@page import="com.minimouse.model.ProductSubCategory"%>
<%@page import="java.util.List"%>
<%@page import="com.minimouse.dao.ProductSubCategoryService"%>
<%@page import="com.minimouse.model.ProductCategory"%>
<%@page import="com.minimouse.dao.ProductCategoryService"%>
<!-- client -->
<%@page import="com.minimouse.model.AddClient"%>
<%@page import="com.minimouse.dao.AddClientService"%>
<%@page import="com.minimouse.model.AddClient"%>
<%@page import="com.minimouse.dao.AddClientService"%>

<!-- client -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Index</title>
<%@include file="Cpanel/css.jsp" %>
<%@include file="Cpanel/js.jsp" %>
	<link rel="shortcut icon" href="img/minimouse header.png" />
	<!-- Apple devices Homescreen icon -->
	<link rel="apple-touch-icon-precomposed" href="img/apple-touch-icon-precomposed.png" />
	<!--  -->
	<style type="text/css">
		.mainFooter
		{
	     background-color: navy;
         color: #fff;
         padding: 10px 5px;
         display:flex;
         justify-content: flex-start;
         text-align: center;
		}

@media (max-width: 500px){
  .mainFooter{
    background-color: orange;
    text-align: center;
  }
}
	</style>

</head>
<body>
<%
	if(session.getAttribute("loggedUserMail")==null)
	{
		response.sendRedirect("Login.jsp");
	}
%>
<%@include file="Cpanel/header.jsp" %>
<style="padding:0px; margin:0px; background-color:#fff;font-family:'Open Sans',sans-serif,arial,helvetica,verdana">

    <!-- #region Jssor Slider Begin -->
    <script src="js/jssor.slider-23.1.5.mini.js" type="text/javascript"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {

            var jssor_1_SlideoTransitions = [
              [{b:900,d:2000,x:-379,e:{x:7}}],
              [{b:900,d:2000,x:-379,e:{x:7}}],
              [{b:-1,d:1,o:-1,sX:2,sY:2},{b:0,d:900,x:-171,y:-341,o:1,sX:-2,sY:-2,e:{x:3,y:3,sX:3,sY:3}},{b:900,d:1600,x:-283,o:-1,e:{x:16}}]
            ];

            var jssor_1_options = {
              $AutoPlay: 1,
              $SlideDuration: 800,
              $SlideEasing: $Jease$.$OutQuint,
              $CaptionSliderOptions: {
                $Class: $JssorCaptionSlideo$,
                $Transitions: jssor_1_SlideoTransitions
              },
              $ArrowNavigatorOptions: {
                $Class: $JssorArrowNavigator$
              },
              $BulletNavigatorOptions: {
                $Class: $JssorBulletNavigator$
              }
            };

            var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);

            /*responsive code begin*/
            /*remove responsive code if you don't want the slider scales while window resizing*/
            function ScaleSlider() {
                var refSize = jssor_1_slider.$Elmt.parentNode.clientWidth;
                if (refSize) {
                    refSize = Math.min(refSize, 1920);
                    jssor_1_slider.$ScaleWidth(refSize);
                }
                else {
                    window.setTimeout(ScaleSlider, 30);
                }
            }
            ScaleSlider();
            $(window).bind("load", ScaleSlider);
            $(window).bind("resize", ScaleSlider);
            $(window).bind("orientationchange", ScaleSlider);
            /*responsive code end*/
        });
    </script>
    <style>
        .jssorb05 {
            position: absolute;
        }
        .jssorb05 div, .jssorb05 div:hover, .jssorb05 .av {
            position: absolute;
            /* size of bullet elment */
            width: 16px;
            height: 16px;
            background: url('img/b05.png') no-repeat;
            overflow: hidden;
            cursor: pointer;
        }
        .jssorb05 div { background-position: -7px -7px; }
        .jssorb05 div:hover, .jssorb05 .av:hover { background-position: -37px -7px; }
        .jssorb05 .av { background-position: -67px -7px; }
        .jssorb05 .dn, .jssorb05 .dn:hover { background-position: -97px -7px; }

        /* jssor slider arrow navigator skin 22 css */
        /*
        .jssora22l                  (normal)
        .jssora22r                  (normal)
        .jssora22l:hover            (normal mouseover)
        .jssora22r:hover            (normal mouseover)
        .jssora22l.jssora22ldn      (mousedown)
        .jssora22r.jssora22rdn      (mousedown)
        .jssora22l.jssora22lds      (disabled)
        .jssora22r.jssora22rds      (disabled)
        */
        .jssora22l, .jssora22r {
            display: block;
            position: absolute;
            /* size of arrow element */
            width: 40px;
            height: 58px;
            cursor: pointer;
            background: url('img/a22.png') center center no-repeat;
            overflow: hidden;
        }
        .jssora22l { background-position: -10px -31px; }
        .jssora22r { background-position: -70px -31px; }
        .jssora22l:hover { background-position: -130px -31px; }
        .jssora22r:hover { background-position: -190px -31px; }
        .jssora22l.jssora22ldn { background-position: -250px -31px; }
        .jssora22r.jssora22rdn { background-position: -310px -31px; }
        .jssora22l.jssora22lds { background-position: -10px -31px; opacity: .3; pointer-events: none; }
        .jssora22r.jssora22rds { background-position: -70px -31px; opacity: .3; pointer-events: none; }
        
        #serviceBox
		{
		    width:100%;
		    margin: 0 auto;
		    margin-top:75px;
		    height:300px;
		    text-align: center;
		}
		.serviceBox1, .serviceBox2, .serviceBox3, .serviceBox4 {
		    float:left;
		    width:21%;
		    margin-left: 45px;
		    border-radius:6px;
		    
		}
		
		.serviceBox1:hover, .serviceBox2:hover, .serviceBox3:hover, .serviceBox4:hover
		{
			-webkit-filter: saturate(2.5);
			-webkit-transition: all 0.7s ease            !important;
			-moz-transition: all 0.7s ease !important;
			-o-transition: all 0.7s ease !important;
			transition: all 0.7s ease !important;
			-webkit-box-shadow: -2px 6px 10px 3px rgba(0,0,0,0.45);
			-moz-box-shadow: -2px 6px 10px 3px rgba(0,0,0,0.45);
			box-shadow: -2px 6px 10px 3px rgba(0,0,0,0.45);
			border-radius:15px;
			
		}
		
		.box{
		    height: 300px;
		    background-color: white;
		    border:1px solid #bdbdbd;
		    -webkit-border-radius: 5px;
		    border-radius: 5px;
		    -moz-box-shadow: 0 0 10px #bdbdbd;
		    -webkit-box-shadow: 0 0 10px #bdbdbd;
		    box-shadow: 0 0 10px #bdbdbd;
		    margin: 20px;
		    
		}
		.serviceBox1{
			background-color: #002A66   !important;
		}
		.serviceBox2{
			background-color: #66002A !important;
		}
		.serviceBox3{
			background-color: #166600   !important;
		}
		.serviceBox4{
			background-color: #665000  !important;
		}
    </style>
    <div id="jssor_1" style="position:relative;margin:0 auto;top:0px;left:0px;width:1349px;height:300px;overflow:hidden;visibility:hidden;">
        <!-- Loading Screen -->
        <div data-u="loading" style="position:absolute;top:0px;left:0px;background-color:rgba(0,0,0,0.7);">
            <div style="filter: alpha(opacity=70); opacity: 0.7; position: absolute; display: block; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
            <div style="position:absolute;display:block;background:url('img/loading.gif') no-repeat center center;top:0px;left:0px;width:100%;height:100%;"></div>
        </div>
        
        <div data-u="slides" style="cursor:default;position:relative;top:0px;left:0px;width:1349px;height:300px;overflow:hidden;">
            <div>
                <img data-u="image" src="img/IMG_163058.jpg" />
                <div style="position:absolute;top:30px;left:30px;width:480px;height:90px;z-index:0;font-size:30px;color:#ffff4d;line-height:60px;text-shadow: 2px 2px 5px red;">MINI-MOUSE</div>
                <div style="position:absolute;top:200px;left:30px;width:480px;height:120px;z-index:0;font-size:20px;color:#ffffff;line-height:38px;">Simple Inventory Management System<br> Easy to use</div>
            </div>
            <div>
                <img data-u="image" src="img/computer-hardware.jpg" />
                <div style="position:absolute;top:30px;left:30px;width:480px;height:90px;z-index:0;font-size:30px;color:#ffffff;line-height:60px;">Easy to Manage Products..... <br>Generate Reports....</div>
                <div style="position:absolute;top:300px;left:30px;width:480px;height:120px;z-index:0;font-size:30px;color:#ffffff;line-height:38px;">Manage Products....</div>
            </div>
        </div>

        <!-- Bullet Navigator -->
        <div data-u="navigator" class="jssorb05" style="bottom:16px;right:16px;" data-autocenter="1">
            <!-- bullet navigator item prototype -->
            <div data-u="prototype" style="width:16px;height:16px;"></div>
        </div>
        <!-- Arrow Navigator -->
        <span data-u="arrowleft" class="jssora22l" style="top:0px;left:8px;width:40px;height:58px;" data-autocenter="2"></span>
        <span data-u="arrowright" class="jssora22r" style="top:0px;right:8px;width:40px;height:58px;" data-autocenter="2"></span>
    </div>
<br/>	
<br/>
<center><h2><font face="Jura">Our Services</font></h2></center>
<div id="serviceBox"> 
    <div class="serviceBox1">
         <div class="box">
        <h2><font face="Jura">Products</font></h2>
        <p> In marketing, a product is anything that can be offered to a market that might satisfy a want or need. In retailing, products are called merchandise. In manufacturing, products are bought as raw materials and sold as finished goods. A service is another common product type.</p>
         </div>
    </div>
     <div class="serviceBox2">
         <div class="box">
        <h2><font face="Jura">Inventory</font></h2>
        <p> Inventory management is a discipline primarily about specifying the shape and placement of stocked goods. It is required at different locations within a facility or within many locations of a supply network to precede the regular and planned course of production and stock of materials.</p>
         </div>
    </div>
    <div class="serviceBox3">
        <div class="box">
       <h2><font face="Jura">Transaction</font></h2>
        <p>In the field of inventory management, a stock keeping unit (SKU) is a distinct type of item for sale and purchase, such as a product or service, and all attributes associated with the item type that distinguish it from other item types.</p>
        </div>
     </div>
    <div class="serviceBox4">
        <div class="box">
        <h2><font face="Jura">Reports</font></h2>
        <p>This reports lists all RMUs in an account, along with basic unit information. The report can include information such as Facility ID, MIN number, service status, latitude and longitude information, and information for units assigned to your user ID such as unit name, ID, type, and status.</p>
        </div>
     </div>
 </div>
<br><br>
<br><br>
<div class="mainFooter">
   <centre><p style="margin-left: 550px;">2017. All rights reserved. Mini-Mouse.</p></centre>
    </div>
</body>
</html>