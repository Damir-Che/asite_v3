// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require_tree .

// /posts/:post_id/likes

$(document).ready(function () {

    //уведомление
    $('.deleteAction').click(function () {
        let current_notification =$(this).parents('.notification_list')[0];
        let not_count = $('.not_count');
        $.ajax({
            url: '/notifications/'+ $(current_notification).attr('data-id'),
            type: 'DELETE',
            success: function (result) {
                $(current_notification).fadeOut(100);
                not_count.html(result.count);
                console.log(result.count);
                console.log(result);
            }
        })
    });

    //лайки
    $('.like').click(function () {
        let like_button = $(this).parents('.section')[0];
        let like_count = $(this);
        let not_count = $('.not_count');
        $.ajax({
            url: '/posts/' + $(like_button).attr('data-id') + '/likes',
            type: 'POST',
            success: function (result) {
                like_count.html('like ' + result.count);
                not_count.html(result.not_count)
                console.log(result.count)
                console.log(result.not_count)
            }
        })
    });



});

