<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Comentario
 *
 * @ORM\Table(name="comentario", indexes={@ORM\Index(name="IDX_53AD8F83F675F31B", columns={"author_id"}), @ORM\Index(name="IDX_53AD8F834B89032C", columns={"new_id"})})
 * @ORM\Entity
 */
class Comentario
{
    /**
     * @var int
     *
     * @ORM\Column(name="new_id", type="integer", nullable=false)
     */
    private $newId;

    /**
     * @var string
     *
     * @ORM\Column(name="content", type="text", length=0, nullable=false)
     */
    private $content;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date_public", type="datetime", nullable=false)
     */
    private $datePublic;

    /**
     * @var \Noticias
     *
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     * @ORM\OneToOne(targetEntity="Noticias")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_comentario", referencedColumnName="id_news")
     * })
     */
    private $idComentario;

    /**
     * @var \Usuarios
     *
     * @ORM\ManyToOne(targetEntity="Usuarios")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="author_id", referencedColumnName="Id_user")
     * })
     */
    private $author;

    public function getNewId(): ?int
    {
        return $this->newId;
    }

    public function setNewId(int $newId): self
    {
        $this->newId = $newId;

        return $this;
    }

    public function getContent(): ?string
    {
        return $this->content;
    }

    public function setContent(string $content): self
    {
        $this->content = $content;

        return $this;
    }

    public function getDatePublic(): ?\DateTimeInterface
    {
        return $this->datePublic;
    }

    public function setDatePublic(\DateTimeInterface $datePublic): self
    {
        $this->datePublic = $datePublic;

        return $this;
    }

    public function getIdComentario(): ?Noticias
    {
        return $this->idComentario;
    }

    public function setIdComentario(?Noticias $idComentario): self
    {
        $this->idComentario = $idComentario;

        return $this;
    }

    public function getAuthor(): ?Usuarios
    {
        return $this->author;
    }

    public function setAuthor(?Usuarios $author): self
    {
        $this->author = $author;

        return $this;
    }


}
