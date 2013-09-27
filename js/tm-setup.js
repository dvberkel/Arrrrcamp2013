(function(tm){
    document.querySelector('.turing-machine').setAttribute('id', 'turing-machine');

    var word = 'II';
    var rulebook = {
        's1' : {
            'I' : { nextState : 's1', write: 'I', move: 'R' },
            '_' : { nextState : 's2', write: 'I', move: 'L' }
        },
        's2' : {
            'I' : { nextState : 's2', write: 'I', move: 'L' },
            '_' : { nextState : 's1', write: '_', move: 'R' }
        }
    };
    var startState = 's1';

    var machine = new tm.Machine(word, rulebook, startState, { blank: '_' });

    new tm.MachineView('turing-machine', machine, { borderCells: 7, delay: 500 });

    var tape = document.querySelector('.tape');
    var tapeWidth = tape.offsetWidth;
    var cells = tape.querySelectorAll('.cell');
    var cellSize = tapeWidth/cells.length - 2;
    for (var index = 0; index < cells.length; index++){
        var cell = cells[index];
        cell.style.width = "" + cellSize + "px";
        cell.style.height = "" + cellSize + "px";
        cell.style.fontSize = "" + 0.8*cellSize + "px";
    }
})(tm);
