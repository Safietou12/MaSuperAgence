<?php

namespace App\Repository;

use App\Entity\Property;
use App\Entity\PropertySearch;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query;
use Doctrine\ORM\QueryBuilder;
use Doctrine\Persistence\ManagerRegistry;
use Knp\Component\Pager\PaginatorInterface;

/**
 * @extends ServiceEntityRepository<Property>
 */
class PropertyRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry, private PaginatorInterface $paginator)
    {
        parent::__construct($registry, Property::class);
    }




    public function findAllVisibleQuery(PropertySearch $search): Query
    {
      $query= $this->findVisibleQuery();

      if($search->getMaxPrice()){

          $query = $query
                   ->andwhere('p.price <= :maxprice')
                   ->setParameter('maxprice', $search->getMaxPrice());
      }

      if($search->getMinSurface()){

        $query = $query
                 ->andwhere('p.surface >= :minsurface')
                 ->setParameter('minsurface', $search->getMinSurface());
    }
                  return $query->getQuery()
                  
                  ;

    }



   
       /**
        * @return Property[] Returns an array of Property objects
        */
    
    /*public function findAllVisible()
    {
       return $this->findVisibleQuery()
                    ->getQuery()
                    ->getResult()
                    
                    ;


    }*/


   /* public function findAllVisibleQuery(): Query
    {
       return $this->findVisibleQuery()
                    ->getQuery()
                    
                    
                    ;


    }*/
    

    public function findLatest()
    {
        return $this->findVisibleQuery()
                    ->setMaxResults(4)
                    ->getQuery()
                    ->getResult()
                    ;

    }

    private function findVisibleQuery(): QueryBuilder
    {

        return $this->createQueryBuilder('p')
        ->where('p.sold = false');
        
    }




    //    /**
    //     * @return Property[] Returns an array of Property objects
    //     */
    //    public function findByExampleField($value): array
    //    {
    //        return $this->createQueryBuilder('p')
    //            ->andWhere('p.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->orderBy('p.id', 'ASC')
    //            ->setMaxResults(10)
    //            ->getQuery()
    //            ->getResult()
    //        ;
    //    }

    //    public function findOneBySomeField($value): ?Property
    //    {
    //        return $this->createQueryBuilder('p')
    //            ->andWhere('p.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }
}
