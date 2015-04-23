(function() {
  'use strict';

  angular
    .module('Fisioeng')
    .controller('ShowAnalyteController', ShowAnalyteController);

  ShowAnalyteController.$inject = ['$http', '$scope', 'GraphModifier'];

  function ShowAnalyteController($http, $scope, GraphModifier) {
    var series;

    $scope.actualYAxis = 0;

    $scope.axis = {};
    $scope.axis.y = {};
    $scope.axis.y.options = [
      {value: '°C', label: 'Temperature in °C'},
      {value: 'URA', label: 'Relative Humidity in %'}
    ];

    $scope.chartConfig = {
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
              text: $scope.axis.y.options[$scope.actualYAxis].label
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
      series: $scope.chartSeries,
      title: {
        text: 'Analyte Measures'
      },
      credits: {
        enabled: true
      },
      loading: true,
      size: {}
    };

    $http
      .get($('[name="measures_route"').attr('content'))
      .then(function(result) {
        series = GraphModifier.gen(result.data);
        $scope.chartSeries = series[0];

        updateGraph();
      });


    $scope.changeYAxis = function (serie) {
      $scope.actualYAxis = serie;
      $scope.chartSeries = series[serie];
      updateGraph();
    };

    function updateGraph() {
      $scope.chartConfig.yAxis.title.text = $scope.axis.y.options[$scope.actualYAxis].label;
      $scope.chartConfig.series = $scope.chartSeries;
      $scope.chartConfig.loading = false;
    }

    function getAleatory ( amount, min, max ) {

      var data = [];
      for (var i = 1; i <= amount; i++ ) {
        data.push([ Date.UTC(2015, 4, 21, i, 0, 0), Math.floor((Math.random() * (max - min)) + min )]);
      }

      return data;
    }
  }

})();
