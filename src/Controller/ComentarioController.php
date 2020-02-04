<?php

namespace App\Controller;

use App\Entity\Comentario;
use App\Form\ComentarioType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/comentario")
 */
class ComentarioController extends AbstractController
{
    /**
     * @Route("/", name="comentario_index", methods={"GET"})
     */
    public function index(): Response
    {
        $comentarios = $this->getDoctrine()
            ->getRepository(Comentario::class)
            ->findAll();

        return $this->render('comentario/index.html.twig', [
            'comentarios' => $comentarios,
        ]);
    }

    /**
     * @Route("/new", name="comentario_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $comentario = new Comentario();
        $form = $this->createForm(ComentarioType::class, $comentario);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($comentario);
            $entityManager->flush();

            return $this->redirectToRoute('comentario_index');
        }

        return $this->render('comentario/new.html.twig', [
            'comentario' => $comentario,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{idComentario}", name="comentario_show", methods={"GET"})
     */
    public function show(Comentario $comentario): Response
    {
        return $this->render('comentario/show.html.twig', [
            'comentario' => $comentario,
        ]);
    }

    /**
     * @Route("/{idComentario}/edit", name="comentario_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Comentario $comentario): Response
    {
        $form = $this->createForm(ComentarioType::class, $comentario);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('comentario_index');
        }

        return $this->render('comentario/edit.html.twig', [
            'comentario' => $comentario,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{idComentario}", name="comentario_delete", methods={"DELETE"})
     */
    public function delete(Request $request, Comentario $comentario): Response
    {
        if ($this->isCsrfTokenValid('delete'.$comentario->getIdComentario(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($comentario);
            $entityManager->flush();
        }

        return $this->redirectToRoute('comentario_index');
    }
}
