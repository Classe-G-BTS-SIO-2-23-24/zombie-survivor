class Weapon {
  int damage;
  int ammo;
  int ammo2;
  float reloadTime;

  Weapon(int weaponDamage,int weaponAmmo,int weaponAmmoLimit, float weaponReloadTime){
    this.damage = weaponDamage;
    this.ammo = weaponAmmo;
    this.ammo2 = weaponAmmoLimit;
    this.reloadTime = weaponReloadTime;
  }
}
