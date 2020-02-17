<?php

namespace App\Controller;

use App\Entity\Categoria;
use App\Entity\Comentario;
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

        $repositoryComentary=$this->getDoctrine()->getRepository(Comentario::class);

        $repositoryCategory=$this->getDoctrine()->getRepository(Categoria::class);

        // retrieve all links
        $noticias = $repository->findAll();
        $comentarios=$repositoryComentary->findAll();
        $categorias=$repositoryCategory->findAll();

        // now pass the array of link object to the view
        return $this->render('noticias/index.html.twig', [
            'noticias' => $noticias,
            'comentarios'=>$comentarios,
            'categorias'=>$categorias,

        ]);
    }
}
