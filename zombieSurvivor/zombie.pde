class Zombie{
    float xPos; 
    float  yPos; 
    float xSpeed;
    float ySpeed;
    PImage img;

    Zombie(float xZombiePos, float  yZombiePos , float xZombieSpeed,  float yZombieSpeed , PImage ZombieImage) {
        this.xPos = xZombiePos;
        this.yPos = yZombiePos;
        this.xSpeed= xZombieSpeed;
        this.ySpeed = yZombieSpeed;
        this.img = ZombieImage;

    } 
} 
