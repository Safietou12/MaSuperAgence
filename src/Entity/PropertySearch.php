<?php
namespace App\Entity;

class PropertySearch {

private  $maxprice;
private  $minsurface;



/**
 * Get the value of minsurface
 */ 
public function getMinsurface()
{
return $this->minsurface;
}

/**
 * Set the value of minsurface
 *
 * @return  Propertry
 */ 
public function setMinsurface($minsurface)
{
$this->minsurface = $minsurface;

return $this;
}

/**
 * Get the value of maxprice
 */ 
public function getMaxprice()
{
return $this->maxprice;
}

/**
 * Set the value of maxprice
 *
 * @return  self
 */ 
public function setMaxprice($maxprice)
{
$this->maxprice = $maxprice;

return $this;
}
}