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
//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
/*global $*/

  // トップ画面のスライダー設定
  $(document).on('turbolinks:load',function(){
    $('.heading-slider').slick({
      dots: true,
      autoplay: true,
      slidesToShow: 1,
      slidesToScroll: 3,
      speed: 2000,
      autoplaySpeed: 3500,
      centerMode: true,
      fade: true
    });
  });

  $(document).on('turbolinks:load',function(){
    $('.latest-slider').slick({
      infinite: true,
      autoplay: true,
      slidesToShow: 5,
      speed: 2000,
      autoplaySpeed: 2000,
      centerMode: true,
      centerPadding: '20px',
      responsive: [
        {
          breakpoint: 770,
          settings: {
            slidesToShow: 4,
            centerMode: false,
          }
        },
        {
          breakpoint: 480,
          settings: {
            slidesToShow: 2,
            centerMode: false,
          }
        }
      ]
    });
  });

  // 行挿入時のインデックス作成のためのグローバル変数
  var count = 10;

  function addRow(table_id) {
    var table = document.getElementById(table_id)
    window.count += 1;

    // tr(行)を末尾に追加
    var row = table.insertRow(-1);
    // td追加
    var cell1 = row.insertCell(-1);
    var cell2 = row.insertCell(-1);
    var cell3 = row.insertCell(-1);

    //つくり方の場合
    if (table_id == "procedure-table"){
      cell1.innerHTML = '<textarea name="post_recipe[procedures_attributes][' + window.count + '][body]" id="post_recipe_body" placeholder="手順を記入" class="p-2 " cols="35" rows="4"></textarea>';
      cell1.classList.add('pl-0');
      cell2.innerHTML = '<input type="button" value="削除" onclick="deleteRow(this)">';
      cell2.classList.add('align-middle');
    //材料の場合
    } else {
      cell1.innerHTML = '<input type="text" name="post_recipe[ingredients_attributes][' + window.count + '][name]" id="post_recipe_name" placeholder="例）にんじん" size="14">';
      cell1.classList.add('py-1');
      cell2.innerHTML = '<input type="text" name="post_recipe[ingredients_attributes][' + window.count + '][amount]" id="post_recipe_amount" placeholder="例）一本" size="14">';
      cell2.classList.add('py-1');
      cell3.innerHTML = '<input type="button" value="削除" onclick="deleteRow(this)">';
      cell3.classList.add('p-0', 'align-middle');
    }
  }

  function deleteRow(obj) {
    // 削除されたボタンを特定
    tr = obj.parentNode.parentNode;
    // trのインデックスを取得して行を削除
    tr.parentNode.deleteRow(tr.sectionRowIndex);
  }

  // ページトップへ戻るボタンの動き
  $(function() {
    $('.move-top a').on('click',function(event){
      $('body, html').animate({
        scrollTop:0
      }, 1000);
      event.preventDefault();
    });
  });

