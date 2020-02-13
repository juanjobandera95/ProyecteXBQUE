<?php

namespace App\Controller;

use App\Entity\Noticias;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class DefaultController extends AbstractController
{
/**
* @Route("/", name="homepage")
*/
    public function index()
    {
        // get the Link repository (it is like our model)
        $repository = $this->getDoctrine()->getRepository(Noticias::class);

        // retrieve all links
        $noticias = $repository->findAll();

        // now pass the array of link object to the view
        return $this->render('noticias/index.html.twig', [
            'noticias' => $noticias,
        ]);
    }
}