module.exports = SmartTags =
  SymbolRegex : ['(',')','{','}','<','>','[',']', ':', ';', '\'', '"']
  activate: (state) ->
    atom.workspace.observeTextEditors (editor) ->
      editor.buffer.onDidChange (change) ->
        currentChar = editor.getTextInBufferRange(change.newRange)
        nextCharRange = change.newRange.translate(change.newRange, [change.newRange.end.row, change.newRange.end.column+1])
        nextChar = editor.getTextInBufferRange(nextCharRange).substr(1,1)
        if SmartTags.SymbolRegex.indexOf(nextChar) > -1 && currentChar == nextChar
            editor.delete()
