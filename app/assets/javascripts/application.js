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


$(document).ready(function () {

    //уведомление
    $('.title_notification').click(function () {
        let current_notification =$(this).parents('.notification_list')[0]; //полуаем весь лок с уведомлением
        let notification_count = $('.notification_count');                  // кол-во уведомлений
        $.ajax({
            url: '/notifications/'+ $(current_notification).attr('data-id'),
            type: 'DELETE',
            success: function (result) {
                $(current_notification).fadeOut(100);                       //плавное удаление уведомлении из списка
                notification_count.html(result.count);                      //изменяем кол-во уведомление в отображении
            }
        })
    });

    //лайки
    $('.like').click(function () {
        let like_button = $(this).parents('.section_post')[0];              //получаем блок с постом(1)
        let like = $(this);                                                 //лайк на который кликнули
        let notification_count = $('.notification_count');                  //кол-во уведомлений
        $.ajax({
            url: '/posts/' + $(like_button).attr('data-id') + '/likes',
            type: 'POST',
            success: function (result) {
                like.html('like ' + result.like);                           //изменяет кол-во лайков в отображении
                notification_count.html(result.notification);               //изменяет кол-во уведомлений в отображении
            }
        })
    });



});

