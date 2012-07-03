// window.onload = function () {
//   var current = null;
//   var map = {};
//   var m = {};       
//   var attr = {
//     fill: "#F2F1EE",
//     stroke: "#BFBFBF",
//     "stroke-width": .5,
//     "stroke-linejoin": "round"
//   };        
//   var map = {};
//   var R = Raphael("holder_570");
//   var zpd = new RaphaelZPD(R, { zoom: true, pan: true, drag: true });
//   render_map(R,map,attr);   
//   for (var state in map) {                      
//             map[state].color = Raphael.getColor();
//             (function (st, state) {
//       st[0].style.cursor = "pointer";
//       st[0].onmouseover = function () {
//         current && map[current].animate({fill: "#F2F1EE", stroke: "#BFBFBF"}, 300);
//         st.animate({fill: "#DCD9D0", stroke: "#BFBFBF"}, 300);
//         R.safari();
//         current = state;
//       };
//       st[0].onmouseout = function () {
//         st.animate({fill: "#F2F1EE", stroke: "#BFBFBF"}, 300);
//         R.safari();
//       };
      
//       // st[0].onclick = function () {
//       //   alert(state);
//       // };
//     })(map[state], state);
//   }; // end for
  
  

//   function lon2x(lon) {
//     var xfactor = 2.752;
//     var xoffset = 473.75;
//     var x = (lon * xfactor) + xoffset;
//     return x;
//   }
//   function lat2y(lat) {
//     var yfactor = -2.753;
//     var yoffset = 231;
//     var y = (lat * yfactor) + yoffset;
//     return y;
//   }

//   var city_attr = {
//     fill: "#6666FF",
//     stroke: "none",
//     opacity: .6
//   };
//   function plot(lat,lon,size) {
//     size = size * .5 + 4;
//     return R.circle(lon2x(lon), lat2y(lat), size).attr(city_attr);
//   }

//   var escapes = {};

//   $.getJSON("/escapes_lat_long.json",
//     function(dataz) {
//       var datum, _i, _len, _results;
//     for (_i = 0, _len = dataz.length; _i < _len; _i++) {
//       datum = dataz[_i];
        
//       escapes[datum.city] = plot(parseFloat(datum.latitude), parseFloat(datum.longitude), datum.votes)
//     }

//   var current_city = null;
//   var city_box = null;
//   for (var city in escapes) {                      
//             map[state].color = Raphael.getColor();
//             (function (st, city) {
//       st[0].style.cursor = "pointer";
//       st[0].onmouseover = function () {
//         current_city && escapes[current_city].animate({fill: "#6666FF", opacity: 1}, 300);
//         st.animate({fill: "#E3C051", opacity: 1}, 300);
//         R.safari();
//         current_city = city;
//       };
//       st[0].onmouseout = function () {
//         st.animate({fill: "#6666FF", opacity: 1}, 300);
//         R.safari();
//       };

//       st[0].onclick = function () {
//         if (t = document.getElementById(city_box)) { t.style.display = "none"; }
//         if (t = document.getElementById(city)) { t.style.display = "block"; }
//         city_box = city;
//       };

//       if (t = document.getElementById(city)) {
//           t.style.left = escapes[city].attr('cx') + 'px';
//           t.style.top = escapes[city].attr('cy') -20 + 'px';
//       }

//     })(escapes[city], city);
//   }; // end for
// });
// };