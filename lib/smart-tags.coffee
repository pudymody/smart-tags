module.exports = SmartTags =
  SymbolRegex : ['(',')','{','}','<','>','[',']', ':', ';', '\'', '"']
  activate: (state) ->
    atom.workspace.observeTextEditors (editor) ->
      editor.onWillInsertText (evt) ->
        currentChar = evt.text

        point = editor.getCursorBufferPosition();
        nextChar = editor.getTextInBufferRange([[point.row,point.column],[point.row,point.column + 1]]);
        if SmartTags.SymbolRegex.indexOf(nextChar) > -1 && currentChar[0] == nextChar
            editor.moveRight( currentChar.length );
            evt.cancel();
