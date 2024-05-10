<?php

namespace App\Controller;

use App\Entity\User;
use App\Repository\PropertyRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class HomeController extends AbstractController
{
    #[Route('/home', name: 'home')]
    public function index(EntityManagerInterface $em, PropertyRepository $repository): Response
    {
        
        $properties = $repository->findLatest();
        return $this->render('home/index.html.twig', [
           
            'properties' => $properties,
        ]);
    }
}
