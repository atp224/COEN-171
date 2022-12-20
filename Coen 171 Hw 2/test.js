// Create canvas
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
var canvas = document.createElement("canvas");
canvas.width = window.innerWidth;
canvas.height = window.innerHeight;
document.body.appendChild(canvas);

// Set up context
var ctx = canvas.getContext("2d");

// Initialize raindrop array
var raindrops = [];

// Create Raindrop class
function Raindrop(x, y, size) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.speed = 10;
}

// Add raindrop to array
function createRaindrop() {
    var x = Math.random() * canvas.width;
    var y = Math.random() * canvas.height;
    var size = Math.random() * 10 + 5;
    raindrops.push(new Raindrop(x, y, size));
}

// Draw raindrops
function drawRaindrops() {
    for (var i = 0; i < raindrops.length; i++) {
        ctx.fillStyle = "#0099FF";
        ctx.fillRect(raindrops[i].x, raindrops[i].y, raindrops[i].size, raindrops[i].size);
    }
}

// Move raindrops
function moveRaindrops() {
    for (var i = 0; i < raindrops.length; i++) {
        raindrops[i].y += raindrops[i].speed;
        if (raindrops[i].y > canvas.height) {
            raindrops.splice(i, 1);
        }
    }
}

// Update raindrops
function updateRaindrops() {
    createRaindrop();
    drawRaindrops();
    moveRaindrops();
    requestAnimationFrame(updateRaindrops);
}

// Call updateRaindrops
updateRaindrops();