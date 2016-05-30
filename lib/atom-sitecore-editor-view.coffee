module.exports =
class AtomSitecoreEditorView
  constructor: (serializedState) ->
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('atom-sitecore-editor')

    # Create message element
    message = document.createElement('div')
    message.textContent = "Thank you for testing the Atom Sitecore Config Editor! Feedback Appreciated!"
    message.classList.add('message')
    @element.appendChild(message)

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element
