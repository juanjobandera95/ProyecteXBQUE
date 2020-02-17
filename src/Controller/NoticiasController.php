<?php

namespace App\Controller;

use App\Entity\Categoria;
use App\Entity\Comentario;
use App\Entity\Noticias;
use App\Form\NoticiasType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/noticias")
 */
class NoticiasController extends AbstractController
{
    /**
     * @Route("/", name="noticias_index", methods={"GET"})
     */
    public function index(): Response
    {
        // get the Link repository (it is like our model)
        $repository = $this->getDoctrine()->getRepository(Noticias::class);

        $repositoryComentary = $this->getDoctrine()->getRepository(Comentario::class);

        $repositoryCategory = $this->getDoctrine()->getRepository(Categoria::class);

        // retrieve all links
        $noticias = $repository->findAll();
        $comentarios = $repositoryComentary->findAll();
        $categorias = $repositoryCategory->findAll();

        // now pass the array of link object to the view
        return $this->render('noticias/index.html.twig', [
            'noticias' => $noticias,
            'comentarios' => $comentarios,
            'categorias' => $categorias,

        ]);
    }

    /**
     * @Route("/new", name="noticias_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $noticia = new Noticias();
        $form = $this->createForm(NoticiasType::class, $noticia);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($noticia);
            $entityManager->flush();

            return $this->redirectToRoute('noticias_index');
        }

        return $this->render('noticias/new.html.twig', [
            'noticia' => $noticia,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{idNews}", name="noticias_show", methods={"GET"})
     */
    public function show(Noticias $noticia): Response
    {
        return $this->render('noticias/show.html.twig', [
            'noticia' => $noticia,
        ]);
    }

    /**
     * @Route("/{idNews}/edit", name="noticias_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Noticias $noticia): Response
    {
        $form = $this->createForm(NoticiasType::class, $noticia);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('noticias_index');
        }

        return $this->render('noticias/edit.html.twig', [
            'noticia' => $noticia,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{idNews}", name="noticias_delete", methods={"DELETE"})
     */
    public function delete(Request $request, Noticias $noticia): Response
    {
        if ($this->isCsrfTokenValid('delete'.$noticia->getIdNews(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($noticia);
            $entityManager->flush();
        }

        return $this->redirectToRoute('noticias_index');
    }
}
