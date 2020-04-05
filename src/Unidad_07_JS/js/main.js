
function maxInArray (array) {
    if (array.length > 0) {
        var max = array[0];
        for (var i = 1; i < array.length; i++) {
            if (array[i] > max) {
                max = array[i];
            }
        }
        return max;
    }
    return NaN;
}

function minInArray (array) {
    if (array.length > 0) {
        var min = array[0];
        for (var i = 1; i < array.length; i++) {
            if (array[i] < min) {
                min = array[i];
            }
        }
        return min;
    }
    return NaN;
}

function sumaInArray (array) {
    var total = 0;
    if (array.length > 0) {
        for (var i = 0; i < array.length; i++) {
            total += array[i];
        }
    }
    return total;
}

function creaArray (longitud, minimo, maximo) {
    var array = [];
    for (var i = 0; i < longitud; i++) {
        array.push(valorAlAzar(minimo, maximo));
    }
    return array;
}

function valorAlAzar(minimo, maximo) {
    return Math.round(Math.random() * (maximo - minimo) + minimo);
}

function quickSort(array, left, right) {
    var index;
    if (array.length > 1) {
        index = partition(array, left, right); //index returned from partition
        if (left < index - 1) { //more elements on the left side of the pivot
            quickSort(array, left, index - 1);
        }
        if (index < right) { //more elements on the right side of the pivot
            quickSort(array, index, right);
        }
    }
    return array;
}

function swap(array, leftIndex, rightIndex){
    var temp = array[leftIndex];
    array[leftIndex] = array[rightIndex];
    array[rightIndex] = temp;
}

function partition(array, left, right) {
    var pivot   = array[Math.floor((right + left) / 2)], //middle element
        i       = left, //left pointer
        j       = right; //right pointer
    while (i <= j) {
        while (array[i] < pivot) {
            i++;
        }
        while (array[j] > pivot) {
            j--;
        }
        if (i <= j) {
            swap(array, i, j); //sawpping two elements
            i++;
            j--;
        }
    }
    return i;
}
