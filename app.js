const searchBar = document.getElementById('superheroName');
const searchBtn = document.getElementById('searchButton');
const generalInfo = document.querySelectorAll('.generalInfo > .container span')
const appearance = document.querySelectorAll('.heroAppearance > .container span')
const heroImg = document.getElementById('heroImg')
const powerstats = document.querySelectorAll('.powerstats > .container span')
const work = document.querySelectorAll('.workDetails span')
const connection = document.querySelectorAll('.connectionDetails span')
const err = document.getElementById('err')
const errorMessage = document.getElementById('errMessage')
const loading = document.getElementById('loading')

let superhero;

const removeErr = () => {
    setTimeout(() => {
    err.classList.remove('show')
    errorMessage.innerText = '';
}, 3000)
}

const updateDisplay = () => {
    // General info
    generalInfo[0].innerText = superhero.name;
    let n = 1;
    for (item in superhero.biography) {
        generalInfo[n].innerText = superhero.biography[item];
        n++
    }

    // Appearance Info
    let i = 0;
    for (item in superhero.appearance) {
        appearance[i].innerText = superhero.appearance[item]
        i++
    }

    // Image
    heroImg.src = superhero.image.url;

    // Powerstats
    let j = 0;
    for (item in superhero.powerstats) {
        powerstats[j].innerText = superhero.powerstats[item]
        j++
    }

    // Work
    let k = 0;
    for (item in superhero.work) {
        work[k].innerText = superhero.work[item]
        k++
    }

    // Connections
    let l = 0
    for (item in superhero.connections) {
        connection[l].innerText = superhero.connections[item]
        l++
    }
}


const getSuperhero = (superheroName) => {
    fetch(`https://www.superheroapi.com/api.php/5880776605272807/search/${superheroName}`)
        .then(response => response.json())
        .then(data => {
            loading.classList.add('show')
            if (data.response == 'error') {
                errorMessage.innerText = `Sorry, I can't seem to be able to find '${superheroName}' in my database :(`
                err.classList.add('show');
                removeErr();
            }
            else if (data.results.length == 3) {
                superhero = data.results[1]
            }
            else if (data.results[2] != undefined) {
                superhero = data.results[2];
            }
            else if (data.results[1] != undefined) {
                superhero = data.results[1];
            }
            else if (data.results[0] != undefined){
                superhero = data.results[0];
            }
            loading.classList.remove('show')
            updateDisplay();
        })
}



const search = () => {
    if (searchBar.value.length > 0) {
        const answer = getSuperhero(searchBar.value);
    }
}

searchBtn.addEventListener('click', () => search())

document.addEventListener('keydown', (e) => {
    if (e.key == 'Enter'){
        search();
    }
})

getSuperhero('batman')
