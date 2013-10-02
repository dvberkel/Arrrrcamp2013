window.rulebook = {
    't1': {
	'I' : { nextState: 't2', write: 'X', move: 'R' }
    },
    't2': {
	'I' : { nextState: 't3', write: 'X', move: 'R' },
	'_' : { nextState: 't6', write: '_', move: 'L' }
    },
    't3': {
	'I' : { nextState: 't3', write: 'I', move: 'R' },
	'_' : { nextState: 's1', write: '_', move: 'R' }
    },
    't4': {
	'_' : { nextState: 't5', write: '_', move: 'L' }
    },
    't5': {
	'I' : { nextState: 't5', write: 'I', move: 'L' },
	'X' : { nextState: 't2', write: 'X', move: 'R' }
    },
    't6': {
	'X' : { nextState: 't7', write: '_', move: 'R' },
	'_' : { nextState: 't9', write: '_', move: 'R' }
    },
    't7': {
	'_' : { nextState: 'm1', write: '_', move: 'R' }
    },
    't8': {
	'_' : { nextState: 't6', write: '_', move: 'L' }
    },
    't9': {
	'_' : { nextState: 'n1', write: '_', move: 'R' }
    },
    't10': {
	'I' : { nextState: 't11', write: 'I', move: 'L' }
    },
    's1' : {
        'I' : { nextState: 's1', write: 'I', move: 'R' },
        '_' : { nextState: 's2', write: 'I', move: 'L' }
    },
    's2' : {
        'I' : { nextState: 's2', write: 'I', move: 'L' },
        '_' : { nextState: 's3', write: '_', move: 'R' }
    },
    's3' : {
        'I' : { nextState: 't4', write: 'I', move: 'L' }
    },
    'm1' : {
	'I' : { nextState: 'm1', write: 'I', move: 'R' },
	'_' : { nextState: 'm2', write: '_', move: 'L' }
    },
    'm2' : {
	'I' : { nextState: 'm3', write: '_', move: 'L' }
    },
    'm3' : {
  	'I' : { nextState: 'm3', write: 'I', move: 'L' },
  	'_' : { nextState: 'm4', write: 'I', move: 'R' }
    },
    'm4' : {
  	'I' : { nextState: 'm5', write: 'I', move: 'L' }
    },
    'm5' : {
  	'I' : { nextState: 't8', write: 'I', move: 'L' }
    },
    'n1' : {
	'I' : { nextState: 'n1', write: 'I', move: 'R' },
	'_' : { nextState: 'n2', write: '_', move: 'L' }
    },
    'n2' : {
	'I' : { nextState: 'n3', write: '_', move: 'L' }
    },
    'n3' : {
  	'I' : { nextState: 'n3', write: 'I', move: 'L' },
  	'_' : { nextState: 'n4', write: 'I', move: 'R' }
    },
    'n4' : {
  	'I' : { nextState: 'n5', write: 'I', move: 'L' }
    },
    'n5' : {
  	'I' : { nextState: 't10', write: 'I', move: 'R' }
    }
};
