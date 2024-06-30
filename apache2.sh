#!/bin/bash

# Update package index
sudo apt update

# Install Apache2
sudo apt install -y apache2

# Start Apache
sudo systemctl start apache2

# Create and populate index.html
sudo tee /var/www/html/index.html > /dev/null <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Podkova:wght@400;500;700&family=Ropa+Sans&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Superhero App</title>
</head>
<body>
    <div id="err" class="err">
        <p id="errMessage"></p>
    </div>
    <main>
        <div class="heroPicture">
            <img id="heroImg" src="https://www.superherodb.com/pictures2/portraits/10/100/639.jpg" alt="Hero Image">
        </div>
        <div class="heroDesc">
            <header>
                <input type="text" name="Superhero name" id="superheroName" placeholder="Enter a superhero name..">
                <button id="searchButton">Search</button>
            </header>
            <div class="mainContent">

                <div class="upperContent">
                    <div class="generalInfo">
                        <h2>General Info</h2>
                        <div class="container">
                            <h3>Name: <span  id="nameValue"></span></h3>
                            <h3>Fullname: <span id="fullnameValue"></span></h3>
                            <h3>Alter Egos: <span id="alterEgoValue"></span></h3>
                            <h3>Aliases: <span id="aliases"></span></h3>
                            <h3>Birth of Place: <span id="birthOfPlaceValue"></span></h3>
                            <h3>First Appearance: <span id="firstAppearanceValue"></span></h3>
                            <h3>Publisher: <span id="publisherValue"></span></h3>
                            <h3>Alignment: <span id="alignmentValue"></span></h3>
                        </div>
                    </div>
    
                    <div class="powerstats">
                        <h2>Powerstats</h2>
                        <div class="container">
                            <h3>Intelligence: <span id="intelligenceValue"></span></h3>
                            <h3>Strength: <span id="strengthValue"></span></h3>
                            <h3>Speed: <span id="speedValue"></span></h3>
                            <h3>Durability: <span id="durabilityValue"></span></h3>
                            <h3>Power: <span id="powerValue"></span></h3>
                            <h3>Combat: <span id="combatValue"></span></h3>
                        </div>
                    </div>
                </div>
                <div class="lowerContent">
                    <div class="heroAppearance">
                        <h2>Appearance</h2>
                        <div class="container">
                            <h3>Gender: <span id="genderValue"></span></h3>
                            <h3>Race: <span id="raceValue"></span></h3>
                            <h3>Height: <span id="heightValue"></span></h3>
                            <h3>Weight: <span id="weightValue"></span></h3>
                            <h3>Eye Color: <span id="eyeColorValue"></span></h3>
                            <h3>Hair Color: <span id="hairColorValue"></span></h3>
                        </div>
                    </div>
                    <div class="extraDetails">
                        <div class="workDetails">
                            <h2>Work</h2>
                            <p>Occupation: <span class="occupationValue"></span></p>
                            <p>Base: <span id="baseValue"></span></p>
                        </div>
                        <div class="connectionDetails">
                            <h2>Connection</h2>
                            <p>Group Affiliation: <span id="groupAffiliationValue"></span></p>
                            <p>Relatives: <span id="relativesValue"></span></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <script src="app.js"></script>
</body>
</html>
EOF

# Create and populate styles.css
sudo tee /var/www/html/styles.css > /dev/null <<EOF

:root {
    --mainBg: #231E1E;
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

h2 {
    font-family: 'Podkova', 'Ropa Sans' !important;
}

span {
    color: gray !important;
}


body {
    height: 100vh;
    /* overflow: hidden; */
    font-family: 'Ropa Sans', sans-serif;
}

main {
    display: flex;
    height: 100%;
    justify-items: normal;
    position: relative;
}

.heroPicture {
    flex-basis: 900px;
    overflow: hidden;
}

.mainContent {
    overflow-y: scroll;
}

img {
    object-fit: cover;
    height: 100%;
    width: 100%;
}

.heroDesc {
    display: flex;
    flex-direction: column;
    width: 100%;
}

header {
    width: 100%;
    background-color: var(--mainBg);
    display: flex;
    align-items: center;
    justify-content: center;
    /* height: 50px; */
    padding: 10px 0;
    border-bottom: 1px solid white;
    gap: 10px;
}

header input {
    width: min(200px, 600px);
    font-size: 1.2rem;
    padding: 7px 6px;
    border-radius: 8px;
    box-shadow: inset 4px 4px 4px rgba(0, 0, 0, 0.25);
}

header input::placeholder {
    font-size: 0.9rem;
}

header button {
    font-size: 1.1rem;
    background-color: #383838;
    color: white;
    padding: 10px 30px;
    border-radius: 30px;
    transition: background-color .3s;
    border: none;
}

header button:active {
    background-color: #707070;
}

.upperContent, .lowerContent {
    display: flex;
    justify-content: space-between;
}

.generalInfo {
    background-color: white;
    width: 100%;
    padding: 10px 30px;
}

.generalInfo h2 {
    margin: 20px 0;
    text-align: center;
}

.generalInfo > .container {
    display: flex;
    flex-direction: column;
    gap: 8px;
    padding: 10px 0;
}

.powerstats {
    background-color: var(--mainBg);
    color: white;
    width: 300px;
    padding: 10px 30px;
}

.powerstats h2 {
    margin: 20px 0;
    text-align: center;
}

.powerstats > .container {
    display: flex;
    gap: 5px;
    flex-direction: column;
}

.lowerContent {
    justify-content: normal;
    min-height: 320px;
}

.heroAppearance {
    flex-basis: 300px;
    background-color: var(--mainBg);
    color: white;
    padding: 0 30px;
}

.heroAppearance h2 {
    text-align: center;
    margin: 30px 0;
}

.heroAppearance >.container {
    display: flex;
    flex-direction: column;
    gap: 8px;
}

.extraDetails {
    background-color: white;
    border-top: 12px solid var(--mainBg);
    width: 100%;
    padding: 30px 30px;
    display: flex;
    flex-direction: column;
    gap: 20px;
}

.workDetails p, .connectionDetails p {
    margin-left: 30px;
}

.extraDetails span {
    font-size: 0.7rem;
}

.err {
    background-color: #00000096;
    position: fixed;
    display: flex;
    justify-content: center;
    top: 0px;
    bottom: 60%;
    left: 0;
    right: 0;
    visibility: hidden;
    z-index: 2;
    padding: 20px;
}

.show {
    visibility: visible !important;
}

#errMessage {
    font-size: 2rem;
    align-self: center;
    color: white;
}

@media only screen and (max-width: 700px) {
    
    body {
        height: fit-content;
    }

    main {
        flex-direction: column;
    }

    .mainContent {
        overflow-x: hidden;
        overflow-y: auto;
        width: 100%;
        box-shadow: 6px 0 30px 0 white;
    }

    header button {
        font-size: .8rem;
        padding: 10px 20px;
    }

    header {
        position: fixed;
        top: 0;
        border: none;
    }
    .lowerContent {
        flex-direction: column;
    }
    .extraDetails {
        position: relative;
    }

    .upperContent {
        flex-wrap: wrap;
    }

    .powerstats {
        width: 100%;
    }
}
EOF

# Create and populate index.js
sudo tee /var/www/html/index.js > /dev/null <<EOF

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
            if (data.response == 'error') {
                console.log('error')
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

EOF

# Set permissions for Apache to access the files
sudo chown -R www-data:www-data /var/www/html

# Restart Apache to apply changes
sudo systemctl restart apache2

echo "Setup completed successfully."