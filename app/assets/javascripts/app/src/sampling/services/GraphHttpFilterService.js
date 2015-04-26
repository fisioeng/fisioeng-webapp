(function() {
  'use strict';

  angular
    .module('Fisioeng')
    .service('GraphHttpFilter', GraphHttpFilter);

  GraphHttpFilter.$inject = ['$http', '$q'];

  function GraphHttpFilter($http, $q) {
    var
        measure_route = $('[name="measures_route"').attr('content'),

        initial_date = '',

        end_date = '',

        granularity = '',

        limit = 50,

        page = 0;

    this.setLimit = function (l) {
      limit = l;
      return this;
    };

    this.getLimit = function () {
      return limit;
    };

    this.setPage = function (p) {
      page = p;
      return this;
    };

    this.getPage = function () {
      return page;
    };

    this.setIniDt = function (date) {
      initial_date = date;
      return this;
    };

    this.getIniDt = function () {
      return initial_date;
    };

    this.setEndDt = function (date) {
      end_date = date;
      return this;
    };

    this.getEndDt = function () {
      return end_date;
    };

    this.requestData = function () {
      var deferred = $q.defer();

      $http
          .get(measure_route + '?'
            + 'ini_dt=' + this.getIniDt()
            + '&end_dt=' + this.getEndDt()
            + '&l=' + this.getLimit()
            + '&p=' + this.getPage()
          )
          .then(function(result) {
              deferred.resolve(result.data);
          });

      return deferred.promise;
    };
  }


})();
