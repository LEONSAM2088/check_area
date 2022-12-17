
async function dirt_cleaner(id) {
    let txt = document.getElementById(id);
    txt.value = txt.value.replace(/[^-0-9]/g, "");
}

let X = 0;
let Y = 0;
let R = 0;

let time = 0;

async function reset_results() {
    await fetch('http://localhost:8080/controller-servlet?Reset=true' );
}
async function click_handler() {
    const reason = document.getElementById('reason');

    reason.innerHTML = '';
    time = new Date().getTime();

    const Xinput = currentX;
    const Yinput = document.getElementById('Y');
    const Rinput = currentR;
    console.log(Yinput)
    if(!Xinput) {reason.innerHTML = 'Введите X'; return;}
    if(!Yinput) {reason.innerHTML = 'Введите Y'; return;}
    if(!Rinput) {reason.innerHTML = 'Введите R'; return;}

    if(Xinput && Yinput && Rinput) {
        X = Xinput;
        Y = Yinput.value;
        R = Rinput;
        if(!X) {reason.innerHTML = 'Введите X'; return;}
        if(!Y) {reason.innerHTML = 'Введите Y'; return;}
        if(!R) {reason.innerHTML = 'Введите R'; return;}
        if(Xinput && Yinput && Yinput && X && Y && R) {

            const form_data = {'X': X, 'Y': Y, 'R': R};


            const response = await fetch('http://localhost:8080/controller-servlet', {method: "POST", body: JSON.stringify({ X: X, Y: Y, R: R })});
            if (true) {
                document.documentElement.innerHTML = await response.text();
            } else {
                const jsonResponse = await response.text();




                //const reason = document.getElementById('reason');

                //reason.innerHTML = jsonResponse;
            }

        }
        else {
            const reason = document.getElementById('reason');

            reason.innerHTML = 'Введены некорректные данные!';
        }


    }
    else {
        const reason = document.getElementById('reason');

        reason.innerHTML = 'Введены некорректные данные!';
    }


}



let currentX;
async function click_X_box_handler(id) {
    let btn = document.getElementById(id);
    let btns = document.querySelectorAll('input[name=X]');
    btns.forEach((other) => {

        other.style.background='#ffffff';

    });
    btn.style.background='#3d3d3d';
    currentX = btn.value;

    console.log(currentX)
}
let currentR;
async function click_R_box_handler(id) {
    let radio = document.getElementById(id);



    currentR = radio.value;
    console.log(currentR)
}





const add_row = (x,y,r,h) => {
    const dataRow = document.createElement('tr');
    const table = document.getElementById('results');
    const dataX = document.createElement('td');
    dataX.innerHTML = x;
    const dataY = document.createElement('td');
    dataY.innerHTML = y;
    const dataR = document.createElement('td');
    dataR.innerHTML = r;


    const dataIsIn = document.createElement('td');
    dataIsIn.innerHTML = h;

    time -= new Date().getTime();
    time=-time;
    const time2 = document.createElement('td');
    time2.innerHTML = time;
    const now = document.createElement('td');
    now.innerHTML = new Date().toLocaleTimeString();
    dataRow.append(dataX, dataY, dataR, dataIsIn, time2, now);
    table.appendChild(dataRow);




}



