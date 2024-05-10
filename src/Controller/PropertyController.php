<?php

namespace App\Controller;

use App\Entity\Property;
use App\Entity\PropertySearch;
use App\Form\PropertySearchType;
use App\Repository\PropertyRepository;
use Doctrine\ORM\EntityManagerInterface;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class PropertyController extends AbstractController
{
    #[Route('/property', name: 'property.index')]
    public function index(PaginatorInterface $paginator, PropertyRepository $repository, Request $request): Response
    {

       /* $property = new Property();
        $property->setTitle(title:'Mon Premier Bien')
                  ->setDescription(description:' description du bien')
                  ->setPrice(price:200000)
                  ->setRooms(rooms:4)
                  ->setBeedrooms(beedrooms:5)
                  ->setHeat(heat:4)
                  ->setSurface(surface:50)
                  ->setFloor(floor:2)
                  ->setCity(city:'Dakar')
                  ->setAddress(address:'keur massar cité gendarmerie 2')
                  ->setPostalCode(postal_code:'34000');
                  
                  $em->persist($property);
                  $em->flush();*/

            
                  $search = new PropertySearch();
                  $form = $this->createForm(PropertySearchType::class, $search);
                  $form->handleRequest($request);
         $properties = $paginator->paginate( $repository->findAllVisibleQuery($search), $request->query->getInt('page', 1), 4);
            //$properties = $repository->findAllVisible();


        return $this->render('property/index.html.twig', [
            'controller_name' => 'properties',
            'properties' => $properties,
            'form' => $form
        ]);
    }

    #[Route('/property/{slug}-{id}', name: 'property.show', requirements: ['slug' => '[a-z0-9\-]*'])]
    public function show(Property $property, PropertyRepository $repository): Response
    {
       $property= $repository->find($property);




        return $this->render('property/show.html.twig', [
            'property' => $property,
            'controller_name' => 'properties',
        ]);

    }
}
