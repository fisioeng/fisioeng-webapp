(function() {
  'use strict';

  angular
    .module('Fisioeng')
    .service('GraphModifier', GraphModifier);

  GraphModifier.$inject = [];

  function GraphModifier() {
    var y_axis_options = [];
    /**
     * Generate the data to graph
     * @param  {Array} data
     * @return {Array}
     */
    this.gen = function (data) {
      var groups;
      if ( !angular.isArray(data) ) {
        return false;
      }

      groups = gen_groups(data);



      return groups;
    };

    this.y_axis_options = function() {
      return y_axis_options;
    };

    function gen_groups (data) {
      var groups = [],
          series = [],
          unitByIndex = {},
          group  = 0,
          serie;

      if (!angular.isArray(data)) {
        return false;
      }

      data.forEach(function(serieData) {

          serie = gen_serie(serieData);

          if (angular.isUndefined(unitByIndex[serie.unit])) {
            unitByIndex[serie.unit] = group;
            add_y_option(serie.unit);
            groups[unitByIndex[serie.unit]] = [];

            group++;
          }

          groups[unitByIndex[serie.unit]].push(serie);

      });

      return groups;
    }

    function add_y_option (unit) {
      var options = {
        '°C': function (unit) {
          y_axis_options.push('Temperature in ' + unit);
        },
        'default': function (unit) {
          y_axis_options.push('Unit ' + unit);
        }
      }

      if (angular.isFunction(options[unit])){
        options[unit](unit);
        return true;
      }
      options['default'](unit);
      return false;
    }

    function gen_serie (serieData) {
      var serie = {};
      if ( angular.isArray(serieData) ) {

        serieData.forEach(function(measure, index) {
          if (0 === index) {
            serie.name = measure.serie_label;
            serie.data = [];
            serie.unit = measure.unit;
          }

          serie.data.push(gen_data(measure));
        })

      }

      return serie;
    }

    function gen_data (measure) {
      var data;

      data = [(new Date(measure.dateandtime)).getTime(), measure.value];

      return data;
    }
  }
})();
