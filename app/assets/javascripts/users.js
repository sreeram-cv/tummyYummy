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
            url: window.location.origin+"/carts/create",
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
var cartId = "";
$(document).on("click",".deleteCartItems",function(e){
    cartId = $(this).parents(".agentName").attr("data-id");
});

$(document).on("click",".deleteConfirmation",function(e){
    $(".agentName[data-id="+cartId+"]").parents(".agents").remove();
    if($(".agents").length==0){
        $(".agentsHeader").after("<div class = 'emptyagents'>The cart is empty</div>");
        $(".submitContainer").remove();
    }
    $.ajax ({
        url: window.location.origin+"/carts/"+cartId,
        type: 'delete',
        dataType: 'json',
        success: function(){
            $("input").attr("checked",false);
            $('.boxContainer').prepend('<div class="alert alert-success">Items deleted successfully</div>');
            $('.alert').delay(1000).fadeOut(function(){
                $(this).remove();
            });
        }
      })
});

var orderId = "";
$(document).on("click",".deleteOrderItems",function(e){
    orderId = $(this).parents(".agentName").attr("data-id");
});

$(document).on("click",".deliveryConfirmation",function(e){
    $(".agentName[data-id="+orderId+"]").parents(".agents").remove();
    if($(".agents").length==0){
        $(".agentsHeader").after("<div class = 'emptyagents'>No orders yet!</div>");
        $(".submitContainer").remove();
    }
    $.ajax ({
        url: window.location.origin+"/orders/"+orderId,
        type: 'delete',
        dataType: 'json',
        success: function(){
            $('.boxContainer').prepend('<div class="alert alert-success">Items removed successfully</div>');
            $('.alert').delay(1000).fadeOut(function(){
                $(this).remove();
            });
        }
      })
});

$(document).on("click",".buyNow",function(e){
    $(".agents").each(function(idx,agent){
        saveOrder(agent);
    });
    var userId= $(".agents:first").find(".agentName").attr("user-id");
    setTimeout(1000,function(){
        $('.boxContainer').prepend('<div class="alert alert-success">Items ordered successfully</div>');
                        $('.alert').delay(1000).fadeOut(function(){
                            $(this).remove();
                        }); 
    })
        
    
});

var saveOrder = function(agent){
    var userId= $(agent).find(".agentName").attr("user-id");
    var agentId= $(agent).find(".agentName").attr("agent-id");
    var cartId= $(agent).find(".agentName").attr("data-id");
    $.ajax ({
        url: window.location.origin+"/orders/new",
        type: 'post',
        dataType: 'json',
        data:{cart_id:cartId,agent_id:agentId,user_id:userId},
        success: function(){
            $.ajax ({
                url: "carts/"+cartId,
                type: 'delete',
                dataType: 'json',
                success: function(){
                    window.location.href = window.location.origin+"/users/"+userId;
                }
            });
        }
    });
};

