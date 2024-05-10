<?php
namespace App\Controller\Admin;

use App\Entity\Property;
use App\Form\PropertyType;
use App\Repository\PropertyRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;

#[IsGranted('ROLE_ADMIN')]
class AdminPropertyController extends AbstractController {


    #[Route('/admin', name:'admin.property.index')]

    public function index(PropertyRepository $repository)
    {
        //$this->denyAccessUnlessGranted('ROLE_USER');
          $properties = $repository->findAll();

       return $this->render('admin/property/index.html.twig', [
           
            'properties' => $properties,
        ]);
    }

    #[Route('/admin/property/create', name:'admin.property.create')]
     

    public function create( Request $request, EntityManagerInterface $em)
    { 
        $property = new Property();
        $form = $this->createForm(PropertyType::class, $property);
        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid())
        {
            $em->persist($property);
            $em->flush();
            $this->addFlash('succes','le bien a bien été créé');
            return $this->redirectToRoute('admin.property.index');
        }

        return $this->render('admin/property/create.html.twig',[
          'property' => $property,
          'form' => $form,

        ]);

    }

    #[Route('/admin/{id}/edit', name:'admin.property.edit')]
     
    public function edit(EntityManagerInterface $em, Property $property, Request $request)
    {
        $form= $this->createForm(PropertyType::class, $property);
        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid()){
            $em->flush();
              $this->addFlash('succes','le bien a bien été modifié');
            return $this->redirectToRoute('admin.property.index');
       

        }
        
        return $this->render('admin/property/edit.html.twig', [
           'property' => $property,
            'form' => $form
           
        ]);
    }

    #[Route('/admin/{id}/delete', name:'admin.property.delete', methods:['DELETE'])]
    
    public function remove(EntityManagerInterface $em, Property $property)
    {
        
        $em->remove($property);
        $em->flush();
        $this->addFlash('succes','le bien a bien été supprimé');
        return $this->redirectToRoute('admin.property.index');
        
    }

}