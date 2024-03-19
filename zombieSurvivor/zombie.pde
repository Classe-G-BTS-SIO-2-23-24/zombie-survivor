class Zombie{
    float xPos; 
    float yPos; 
    float xSpeed;
    float Angle=0 ; 
    int vie ; 
    PImage img;
    

    Zombie(float xZombiePos, float  yZombiePos , float ZombieSpeed,
    float Zombieangle, int Zombievie,  PImage ZombieImage) {
        this.xPos = xZombiePos;
        this.yPos = yZombiePos;
        this.xSpeed= ZombieSpeed;
        this.Angle=Zombieangle; 
        this.vie=Zombievie;
        this.img = ZombieImage;

    } 
} 
