$(document).ready(function(){
  $('#wagon_type').change(function(){
   var type = "";
   
   $( "select option:selected" ).each(function() {
      type += $( this ).text();
    });
   if (type === "EconomyWagon") {
    $('.lux, .sitting, .coupe').addClass("hidden");
    $('.economy').removeClass("hidden");
  };

  if (type === "CoupeWagon") {
    $('.lux, .sitting, .economy').addClass("hidden");
    $('.coupe').removeClass("hidden");
  };

  if (type === "SittingWagon") {
    $('.lux, .economy, .coupe').addClass("hidden");
    $('.sitting').removeClass("hidden");
  };

  if (type === "LuxWagon") {
    $('.economy, .sitting, .coupe').addClass("hidden");
    $('.lux').removeClass("hidden");
  };


  });
});