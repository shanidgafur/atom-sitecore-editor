AtomSitecoreEditorView = require './atom-sitecore-editor-view'
{CompositeDisposable} = require 'atom'

module.exports = AtomSitecoreEditor =
  atomSitecoreEditorView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @atomSitecoreEditorView = new AtomSitecoreEditorView(state.atomSitecoreEditorViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @atomSitecoreEditorView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'atom-sitecore-editor:toggle': => @toggle()
    @subscriptions.add atom.commands.add 'atom-workspace', 'atom-sitecore-editor:addConfig': => @addConfig()
    @subscriptions.add atom.commands.add 'atom-workspace', 'atom-sitecore-editor:about': => @about()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @atomSitecoreEditorView.destroy()

  serialize: ->
    atomSitecoreEditorViewState: @atomSitecoreEditorView.serialize()

  toggle: ->
    console.log 'AtomSitecoreEditor was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()

  addConfig: ->
    console.log 'addConfig was invoked!!'

  about: ->
    console.log 'about was invoked!!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
