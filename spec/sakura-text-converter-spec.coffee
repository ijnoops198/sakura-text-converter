Test = require '../lib/sakura-text-converter'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "SakuraTextConverter", ->
  [workspaceElement, activationPromise] = []

  beforeEach ->
    workspaceElement = atom.views.getView(atom.workspace)
    activationPromise = atom.packages.activatePackage('sakura-text-converter')

  describe "when the sakura-text-converter event is triggered", ->
    it "hides and shows the modal panel", ->
      # Before the activation event the view is not on the DOM, and no panel
      # has been created
      expect(workspaceElement.querySelector('.sakura-text-converter')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.commands.dispatch workspaceElement, 'sakura-text-converter:wideToHalf'
      atom.commands.dispatch workspaceElement, 'sakura-text-converter:halfWithWideWithHiraganaToWideKana'
      atom.commands.dispatch workspaceElement, 'sakura-text-converter:halfWithWideWithKanaToHiragana'
      atom.commands.dispatch workspaceElement, 'sakura-text-converter:wideAlphabetWithNumberToHalfAlphabetWithNumber'
      atom.commands.dispatch workspaceElement, 'sakura-text-converter:halfAlphabetWithNumberToWideAlphabetWithNumber'
      atom.commands.dispatch workspaceElement, 'sakura-text-converter:wideKanaToHalfKana'
      atom.commands.dispatch workspaceElement, 'sakura-text-converter:halfKanaToWideKana'
      atom.commands.dispatch workspaceElement, 'sakura-text-converter:halfKanaToHiragana'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(workspaceElement.querySelector('.sakura-text-converter')).toExist()

        testElement = workspaceElement.querySelector('.sakura-text-converter')
        expect(testElement).toExist()

        testPanel = atom.workspace.panelForItem(testElement)
        expect(testPanel.isVisible()).toBe true
        atom.commands.dispatch workspaceElement, 'sakura-text-converter:wideToHalf'
        atom.commands.dispatch workspaceElement, 'sakura-text-converter:halfWithWideWithHiraganaToWideKana'
        atom.commands.dispatch workspaceElement, 'sakura-text-converter:halfWithWideWithKanaToHiragana'
        atom.commands.dispatch workspaceElement, 'sakura-text-converter:wideAlphabetWithNumberToHalfAlphabetWithNumber'
        atom.commands.dispatch workspaceElement, 'sakura-text-converter:halfAlphabetWithNumberToWideAlphabetWithNumber'
        atom.commands.dispatch workspaceElement, 'sakura-text-converter:wideKanaToHalfKana'
        atom.commands.dispatch workspaceElement, 'sakura-text-converter:halfKanaToWideKana'
        atom.commands.dispatch workspaceElement, 'sakura-text-converter:halfKanaToHiragana'
        expect(testPanel.isVisible()).toBe false

    it "hides and shows the view", ->
      # This test shows you an integration test testing at the view level.

      # Attaching the workspaceElement to the DOM is required to allow the
      # `toBeVisible()` matchers to work. Anything testing visibility or focus
      # requires that the workspaceElement is on the DOM. Tests that attach the
      # workspaceElement to the DOM are generally slower than those off DOM.
      jasmine.attachToDOM(workspaceElement)

      expect(workspaceElement.querySelector('.sakura-text-converter')).not.toExist()

      # This is an activation event, triggering it causes the package to be
      # activated.
      atom.commands.dispatch workspaceElement, 'sakura-text-converter:wideToHalf'
      atom.commands.dispatch workspaceElement, 'sakura-text-converter:halfWithWideWithHiraganaToWideKana'
      atom.commands.dispatch workspaceElement, 'sakura-text-converter:halfWithWideWithKanaToHiragana'
      atom.commands.dispatch workspaceElement, 'sakura-text-converter:wideAlphabetWithNumberToHalfAlphabetWithNumber'
      atom.commands.dispatch workspaceElement, 'sakura-text-converter:halfAlphabetWithNumberToWideAlphabetWithNumber'
      atom.commands.dispatch workspaceElement, 'sakura-text-converter:wideKanaToHalfKana'
      atom.commands.dispatch workspaceElement, 'sakura-text-converter:halfKanaToWideKana'
      atom.commands.dispatch workspaceElement, 'sakura-text-converter:halfKanaToHiragana'

      waitsForPromise ->
        activationPromise

      runs ->
        # Now we can test for view visibility
        testElement = workspaceElement.querySelector('.sakura-text-converter')
        expect(testElement).toBeVisible()
        atom.commands.dispatch workspaceElement, 'sakura-text-converter:wideToHalf'
        atom.commands.dispatch workspaceElement, 'sakura-text-converter:halfWithWideWithHiraganaToWideKana'
        atom.commands.dispatch workspaceElement, 'sakura-text-converter:halfWithWideWithKanaToHiragana'
        atom.commands.dispatch workspaceElement, 'sakura-text-converter:wideAlphabetWithNumberToHalfAlphabetWithNumber'
        atom.commands.dispatch workspaceElement, 'sakura-text-converter:halfAlphabetWithNumberToWideAlphabetWithNumber'
        atom.commands.dispatch workspaceElement, 'sakura-text-converter:wideKanaToHalfKana'
        atom.commands.dispatch workspaceElement, 'sakura-text-converter:halfKanaToWideKana'
        atom.commands.dispatch workspaceElement, 'sakura-text-converter:halfKanaToHiragana'
        expect(testElement).not.toBeVisible()
