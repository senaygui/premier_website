//= require jquery
//= require active_admin/base
//= require activeadmin_addons/all
//= require active_admin_scoped_collection_actions
//= require activestorage
//= require active_storage_drag_and_drop


$(document).ready(function(){

  $("#almuni_photo").change(function(data){

    var imageFile = data.target.files[0];
    var reader = new FileReader();
    reader.readAsDataURL(imageFile);

    reader.onload = function(evt){
      $('#imagePreview').attr('src', evt.target.result);
      $('#imagePreview').hide();
      $('#imagePreview').fadeIn(650);
    }
    
  });
});