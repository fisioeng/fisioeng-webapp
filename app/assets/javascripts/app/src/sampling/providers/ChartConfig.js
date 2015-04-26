(function() {
  'use strict';

  angular
    .module('Fisioeng')
    .provider('ChartConfig', function() {
      var
          service = {},

          chartConfig = {
            options: {
              chart: {
                type: 'spline'
              },
              plotOptions: {
                series: {
                  stacking: ''
                }
              }
            },
            xAxis: {
                type: 'datetime',
                dateTimeLabelFormats: { // don't display the dummy year
                    month: '%e. %b',
                    year: '%b'
                },
                title: {
                    text: 'Date and Time'
                }
            },
            yAxis: {
                title: {
                    text: 'Value of measure'
                }
            },
            tooltip: {
                headerFormat: '<b>{series.name}</b><br>',
                pointFormat: '{point.x:%e. %b}: {point.y:.2f}'
            },
            plotOptions: {
                spline: {
                    marker: {
                        enabled: true
                    }
                }
            },
            series: [],
            title: {
              text: 'Analyte Measures'
            },
            credits: {
              enabled: true
            },
            loading: true,
            size: {}
          };

      this.$get = function() {

        service.config = function() {
          return chartConfig;
        };

        return service;
      };

    });

})();
