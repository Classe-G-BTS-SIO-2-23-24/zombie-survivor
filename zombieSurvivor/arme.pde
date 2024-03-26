class Weapon {
  String name;
  int damage;
  int ammo;
  int ammo2;
  float reloadTime;

  Weapon(String weaponName,int weaponDamage,int weaponAmmo,int weaponAmmoLimit, float weaponReloadTime){
    this.name = weaponName;
    this.damage = weaponDamage;
    this.ammo = weaponAmmo;
    this.ammo2 = weaponAmmoLimit;
    this.reloadTime = weaponReloadTime;
  }
}
