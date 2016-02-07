(function() {
  'use strict';

  angular
    .module('Fisioeng')
    .controller('GraphController', GraphController);

  GraphController.$inject = ['GraphHttpFilter', '$scope', 'GraphModifier', 'ChartConfig'];

  function GraphController(GraphHttpFilter, $scope, GraphModifier, ChartConfig) {

    var series,
        $periodsContainer = $('form .js-period-inputs'),
        interval;

    $scope.ini_dt = '';
    $scope.end_dt = '';
    $scope.auto_update_time = 5;
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

    $scope.auto = function() {
      if (!$scope.auto_update){
        $periodsContainer.show();
        clearInterval(interval);
        return;
      }

      $periodsContainer.hide();

      function getData() {
        var minutesAgo = moment.duration(1, 'minutes'),
            date = moment(Date.now());

        date.subtract(minutesAgo);

        GraphHttpFilter.setIniDt(date.format('Y/MM/DD HH:mm'))
                       .setLimit('')
                       .setPage('');

        GraphHttpFilter
          .requestData()
          .then(function(data) {
            series = GraphModifier.gen(data);
            $scope.chartSeries = series[$scope.actualYAxis];
            updateGraph();
          });

          console.log(date.toDate());
          console.log(Date.now());
      }

      getData();
      interval = setInterval(getData, $scope.auto_update_time * 1000)
    };

    function updateGraph() {
      $scope.chartConfig.series = $scope.chartSeries;
      $scope.chartConfig.loading = false;
    }
  }

})();
