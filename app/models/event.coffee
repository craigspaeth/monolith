config  = require '../config/config'
Model   = require '../core/model'
renderer = new marked.Renderer

module.exports = class Event extends Model

  formatDateTime: (attr, format)->
    moment(@get(attr)).format(format)

  mdToHtml: (attr, options = {}) ->
    marked.setOptions _.defaults options,
      renderer: renderer
      gfm: true
      tables: true
      breaks: true
      pedantic: false
      sanitize: true
      smartypants: false
    marked @get(attr) or ''


