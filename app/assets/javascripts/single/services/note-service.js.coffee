angular.module('antinoteApp').factory 'Note', ($resource) ->
  return $resource('/api/notes/:id', {id: '@id'}, {
    getData: {method: 'GET', isArray: false}
    })  