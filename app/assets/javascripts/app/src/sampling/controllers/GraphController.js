(function() {
  'use strict';

  angular
    .module('Fisioeng')
    .controller('GraphController', GraphController);

  GraphController.$inject = ['GraphHttpFilter', '$scope', 'GraphModifier', 'ChartConfig'];

  function GraphController(GraphHttpFilter, $scope, GraphModifier, ChartConfig) {

    var
        /**
         * Series of graph
         */
        series;

    $scope.ini_dt = '';
    $scope.end_dt = '';

    $scope.actualYAxis = 0;
    $scope.y_axis_options = [];

    $scope.chartConfig = ChartConfig.config();

    GraphHttpFilter
      .requestData()
      .then(function(data) {
        series = GraphModifier.gen(data);
        $scope.chartSeries = series[$scope.actualYAxis];
        $scope.y_axis_options = GraphModifier.y_axis_options();
        updateGraph();
      });


    $scope.filterByDate = function () {
      GraphHttpFilter.setIniDt($scope.ini_dt)
                     .setEndDt($scope.end_dt)
                     .setLimit('')
                     .setPage('');

      GraphHttpFilter
        .requestData()
        .then(function(data) {
          series = GraphModifier.gen(data);
          $scope.chartSeries = series[$scope.actualYAxis];
          updateGraph();
        });
    };

    $scope.changeYAxis = function (serie) {
      $scope.actualYAxis = serie;
      $scope.chartSeries = series[serie];
      updateGraph();
    };

    function updateGraph() {
      $scope.chartConfig.series = $scope.chartSeries;
      $scope.chartConfig.loading = false;
    }
  }

})();
