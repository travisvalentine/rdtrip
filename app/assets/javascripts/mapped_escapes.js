window.onload = function () {
  var current = null;
  var map = {};
  var m = {};       
  var attr = {
    fill: "#333",
    stroke: "#888",
    "stroke-width": .5,
    "stroke-linejoin": "round"
  };        
  var map = {};
  var R = Raphael("holder_570");
  render_map(R,map,attr);   
  for (var state in map) {                      
            map[state].color = Raphael.getColor();
            (function (st, state) {
      st[0].style.cursor = "pointer";
      st[0].onmouseover = function () {
        current && map[current].animate({fill: "#333", stroke: "#666"}, 300);
        // st.animate({fill: st.color, stroke: "#ccc"}, 300);
        R.safari();
        // current = state;
      };
      st[0].onmouseout = function () {
        st.animate({fill: "#333", stroke: "#666"}, 300);
        R.safari();
      };
      
      // st[0].onclick = function () {
      //   alert(state);
      // };
    })(map[state], state);
  }; // end for
  
  

  function lon2x(lon) {
      var xfactor = 1.5255;
      var xoffset = 263.58;
      var x = (lon * xfactor) + xoffset;
      return x;
  }
  function lat2y(lat) {
    var yfactor = -1.5255;
    var yoffset = 130.5;
    var y = (lat * yfactor) + yoffset;
    return y;
  }

  var city_attr = {
    fill: "#0f0",
    stroke: "none",
    opacity: .3
  };
  function plot(lat,lon,size) {
    size = size * .5 + 4;
    return R.circle(lon2x(lon), lat2y(lat), size).attr(city_attr);
  }


  var escapes = {};

  $.getJSON("/escapes_lat_long", function(data) {
    var datum, _i, _len, _results;
    _results = [];
    for (_i = 0, _len = data.length; _i < _len; _i++) {
      datum = data[_i];
      _results.push(escapes[datum.city] = plot(parseFloat(datum.latitude), parseFloat(datum.longitude), 1));
    }
    return _results;
  });

  // escapes.Nellysford        = plot(37.9069562,-78.8527841,1);
  // escapes.Charles_Town      = plot(39.2536975,-77.9335429,1);
  // escapes.South_Kent        = plot(41.707031,-73.47237,1);
  // escapes.Southold          = plot(41.0434,-72.2416,1);
  // escapes.Hunter            = plot(42.185741,-74.19479,1);
  // escapes.Castries          = plot(14.096,-60.928,1);
  // escapes.Kingston          = plot(18.0086416,-76.7859076,1);
  // escapes.Athens            = plot(37.9721909,23.726174,1);
  // escapes.Roma              = plot(41.9072289,12.487806,1);
  // escapes.Playa_del_Carmen  = plot(20.7775,-86.9557,1);
  // escapes.Prague            = plot(47.516024,19.0750157,1);
  // escapes.Riviera_Maya      = plot(20.764,-86.964,1);
  // escapes.Belmopan          = plot(16.8396,-88.2709,1);
  // escapes.Cabo_San_Lucas    = plot(22.8777,-109.9035,1);
  // escapes.San_Jose_del_Cabo = plot(23.0446,-109.6971,1);
  // escapes.Beijing           = plot(39.9611712,116.4683526,1);
  // escapes.Niagara_Falls     = plot(43.0855464,-79.0843665,1);
  // escapes.Thompsonville     = plot(44.5192603,-85.9906554,1);
  // escapes.West_Dover        = plot(42.940526,-72.856729,1);
  // escapes.Montreal          = plot(45.495997,-73.5805397,1);
  // escapes.Hiawassee         = plot(34.9308688,-83.6896923,1);
  // escapes.Mount_Dora        = plot(28.801546,-81.6425103,1);
  // escapes.Lake_Worth        = plot(26.6168109,-80.048738,1);
  // escapes.New_Orleans       = plot(29.9402619,-90.0748236,1);
  // escapes.Fort_Worth        = plot(32.7471031,-97.3250713,1);
  // escapes.Vail              = plot(39.639957,-106.37121,1);
  // escapes.Midway            = plot(40.5222815,-111.4844942,1);
  // escapes.Scottsdale        = plot(33.639441,-111.896969,1);
  // escapes.Paso_Robles       = plot(35.62317,-120.692842,1);
  // escapes.Palm_Springs      = plot(33.831334,-116.54503,1);
  // escapes.Fullerton         = plot(33.8778684,-117.8824378,1);
  // escapes.Sanger            = plot(36.7905336,-119.3086123,1);
  // escapes.Olympia           = plot(47.042536,-122.901973,1);
  // escapes.Deschutes         = plot(44.3671561,-121.1403059,1);
  // escapes.Sooke             = plot(48.367307,-123.7313433,1);
  // escapes.Graeagle          = plot(39.7931409,-120.6377465,1);
  // escapes.Santa_Rosa        = plot(38.4752864,-122.7283842,1);

  var current_city = null;
  var city_box = null;
  for (var city in escapes) {                      
            map[state].color = Raphael.getColor();
            (function (st, city) {
      st[0].style.cursor = "pointer";
      st[0].onmouseover = function () {
        current_city && escapes[current_city].animate({fill: "#0f0", opacity: .3}, 300);
        st.animate({fill: "#0f0", opacity: 1}, 300);
        R.safari();
        current_city = city;
      };
      st[0].onmouseout = function () {
        st.animate({fill: "#0f0", opacity: .3}, 300);
        R.safari();
      };
      
      st[0].onclick = function () {
        if (t = document.getElementById(city_box)) { t.style.display = "none"; }
        if (t = document.getElementById(city)) { t.style.display = "block"; }
        city_box = city;
      };


      if (t = document.getElementById(city)) {
          t.style.left = escapes[city].attr('cx') + 'px';
          t.style.top = escapes[city].attr('cy') -20 + 'px';
      }

    })(escapes[city], city);
  }; // end for


};