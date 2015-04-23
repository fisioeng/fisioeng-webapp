(function() {
  'use strict';

  angular
    .module('Fisioeng')
    .service('GraphModifier', GraphModifier);

  GraphModifier.$inject = [];

  function GraphModifier() {

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

            groups[unitByIndex[serie.unit]] = [];

            group++;
          }

          groups[unitByIndex[serie.unit]].push(serie);

      });

      return groups;
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
