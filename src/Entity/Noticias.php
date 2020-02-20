<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * Noticias
 *
 * @ORM\Table(name="noticias", indexes={@ORM\Index(name="title", columns={"title"}), @ORM\Index(name="author_id", columns={"author_id"})})
 * @ORM\Entity
 */
class Noticias
{
    /**
     * @var int
     *
     * @ORM\Column(name="idnews", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idnews;

    /**
     * @var int
     *
     * @ORM\Column(name="author_id", type="integer", nullable=false)
     */
    private $authorId;

    /**
     * @var string
     *
     * @ORM\Column(name="title", type="string", length=255, nullable=false)
     */
    private $title;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date_public", type="datetime", nullable=false)
     */
    private $datePublic;

    /**
     * @var string
     *
     * @ORM\Column(name="content", type="text", length=0, nullable=false)
     */
    private $content;

    /**
     * @var string
     *
     * @ORM\Column(name="summary", type="string", length=255, nullable=false)
     */
    private $summary;



    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="Categoria", inversedBy="noticia")
     * @ORM\JoinTable(name="noticia_categoria",
     *   joinColumns={
     *     @ORM\JoinColumn(name="noticia_id", referencedColumnName="idnews")
     *   },
     *   inverseJoinColumns={
     *     @ORM\JoinColumn(name="categoria_id", referencedColumnName="id_categoria")
     *   }
     * )
     */
    private $categoria;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->categoria = new \Doctrine\Common\Collections\ArrayCollection();
    }

    public function getIdNews(): ?int
    {
        return $this->idnews;
    }

    public function getAuthorId(): ?int
    {
        return $this->authorId;
    }

    public function setAuthorId(int $authorId): self
    {
        $this->authorId = $authorId;

        return $this;
    }

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function setTitle(string $title): self
    {
        $this->title = $title;

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

    public function getContent(): ?string
    {
        return $this->content;
    }

    public function setContent(string $content): self
    {
        $this->content = $content;

        return $this;
    }

    public function getSummary(): ?string
    {
        return $this->summary;
    }

    public function setSummary(string $summary): self
    {
        $this->summary = $summary;

        return $this;
    }



    /**
     * @return Collection|Categoria[]
     */
    public function getCategoria(): Collection
    {
        return $this->categoria;
    }

    public function addCategorium(Categoria $categorium): self
    {
        if (!$this->categoria->contains($categorium)) {
            $this->categoria[] = $categorium;
        }

        return $this;
    }

    public function removeCategorium(Categoria $categorium): self
    {
        if ($this->categoria->contains($categorium)) {
            $this->categoria->removeElement($categorium);
        }

        return $this;
    }

    public function __toString()
    {
        // TODO: Implement __toString() method.

        return $this->title;
    }

}
