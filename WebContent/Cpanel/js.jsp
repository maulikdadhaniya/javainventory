<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

	<script src="js/my.js"></script>
	<script src="js/jquery-1.12.4.js"></script>
	<script src="js/plugins/nicescroll/jquery.nicescroll.min.js"></script>
	<script src="js/plugins/validation/jquery.validate.min.js"></script>
	<script src="js/plugins/validation/additional-methods.min.js"></script>
	<script src="js/plugins/icheck/jquery.icheck.min.js"></script>
	<!-- Bootstrap -->	
	<!-- <script src="js/bootstrap.min.js"></script> -->
	<!-- <script src="js/eakroko.js"></script> -->
	<!-- Nice Scroll -->
	<script src="js/plugins/nicescroll/jquery.nicescroll.min.js"></script>
	<!-- imagesLoaded -->
	<script src="js/plugins/imagesLoaded/jquery.imagesloaded.min.js"></script>
	<!-- jQuery UI -->
	<script src="js/plugins/jquery-ui/jquery.ui.core.min.js"></script>
	<script src="js/plugins/jquery-ui/jquery.ui.widget.min.js"></script>
	<script src="js/plugins/jquery-ui/jquery.ui.mouse.min.js"></script>
	<script src="js/plugins/jquery-ui/jquery.ui.resizable.min.js"></script>
	<script src="js/plugins/jquery-ui/jquery.ui.sortable.min.js"></script>
	<script src="js/plugins/jquery-ui/jquery.ui.datepicker.min.js"></script>
	<!-- slimScroll -->
	<script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<!-- Bootbox -->
	<script src="js/plugins/bootbox/jquery.bootbox.js"></script>
	<!-- dataTables -->
	<!-- <script src="js/plugins/datatable/jquery.dataTables.min.js"></script>
	<script src="js/plugins/datatable/TableTools.min.js"></script>
	<script src="js/plugins/datatable/ColReorderWithResize.js"></script>
	<script src="js/plugins/datatable/ColVis.min.js"></script>
	<script src="js/plugins/datatable/jquery.dataTables.columnFilter.js"></script>
	<script src="js/plugins/datatable/jquery.dataTables.grouping.js"></script> -->
	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/dataTables.bootstrap.min.js"></script>
	<script src="js/dataTables.buttons.min.js"></script>
	<script src="js/buttons.flash.min.js"></script>
	<script src="js/jszip.min.js"></script>
	<script src="js/pdfmake.min.js"></script>
	<script src="js/vfs_fonts.js"></script>
	<script src="js/buttons.html5.min.js"></script>
	<script src="js/buttons.print.min.js"></script>
	
	
	<!-- Chosen -->
	<script src="js/plugins/chosen/chosen.jquery.min.js"></script>
	<!-- Theme framework -->
	<!-- <script src="js/eakroko.min.js"></script> -->
	<!-- Theme scripts -->
	<!-- <script src="js/application.min.js"></script> -->
	<!-- Just for demonstration -->
	<!-- script src="js/demonstration.min.js"></script> -->
		<!--[if lte IE 9]>
		<script src="js/plugins/placeholder/jquery.placeholder.min.js"></script>
		<script>
			$(document).ready(function() {
				$('input, textarea').placeholder();
			});
		</script>
	<![endif]-->
	<script>
		/* $(document).ready(function() {
			$( "li .dropdown-toggle" ).hover(
			  function() {
				$( this ).parent().find( ".dropdown-menu" ).css( "display", "block" );
			    //$( this ).append( $( "<span> ***</span>" ) );
			  }, function() {
				 //$( this ).parent().find( ".dropdown-menu" ).css( "display", "none" );
			  }
			);
		});  */
		
		$(document).ready(function() {
			$( ".dropdown-toggle" ).hover(
			  function() {
				$( this ).parent().parent().find( "ul" ).css( "display", "none" );
				$( this ).parent().find( ".dropdown-menu" ).slideDown('medium');
			    
			  }, function() {
				  //$( this ).parent().find( ".dropdown-menu" ).slideUp('medium');
			  }	
			);
			
			$( "ul li" ).hover(
			  function() {
				
				//$( this ).parent().find( ".dropdown-menu" ).slideDown('medium');
				
			  }, function() {
				 
				  $( this ).parent().find( ".dropdown-menu" ).slideUp('medium');
				  
			  }
			);
		}); 
	</script>
