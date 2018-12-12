$(document).on("click",".agentName",function(e){
    var check = $(this).next().hasClass("hide");
    $(".itemsContainer").addClass("hide");
    $("input").attr("checked",false);
    if(check){
        $(this).next().removeClass("hide");
    }else{
        $(this).next().addClass("hide");
    }
});
$(document).on("click",".addToCart",function(e){
    var selected = [];
    $('input:checked').each(function() {
        selected.push($(this).next().text().trim());
    });
    var items = selected.join(",");
    var agent_id = $(this).parents(".agents").find(".agentName").attr("data-id").trim();
    var user_id = $(this).parents(".agents").find(".agentName").attr("user-id").trim();
    if(selected.length>0){
        $.ajax ({
            url: "http://localhost:3000/carts/create",
            type: 'post',
            dataType: 'json',
            data:{cart:{items,agent_id,user_id}},
            success: function(){
                $("input").attr("checked",false);
                $('.boxContainer').prepend('<div class="alert alert-success">Items added to cart successfully</div>');
                $('.alert').delay(1000).fadeOut(function(){
                    $(this).remove();
                });
            }
          })
    }   
});
$(document).on("click",".deleteConfirmation",function(e){
    var cartId = $(this).parents(".agentName").attr(data-id);
    
});
