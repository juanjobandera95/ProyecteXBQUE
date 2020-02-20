<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * Categoria
 *
 * @ORM\Table(name="categoria", uniqueConstraints={@ORM\UniqueConstraint(name="nomCategoria", columns={"nomCategoria"})})
 * @ORM\Entity
 */
class Categoria
{
    /**
     * @var int
     *
     * @ORM\Column(name="id_categoria", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idCategoria;

    /**
     * @var string
     *
     * @ORM\Column(name="nomCategoria", type="string", length=255, nullable=false)
     */
    private $nomcategoria;

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="Noticias", mappedBy="categoria")
     */
    private $noticia;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->noticia = new \Doctrine\Common\Collections\ArrayCollection();
    }

    public function getIdCategoria(): ?int
    {
        return $this->idCategoria;
    }

    public function getNomcategoria(): ?string
    {
        return $this->nomcategoria;
    }

    public function setNomcategoria(string $nomcategoria): self
    {
        $this->nomcategoria = $nomcategoria;

        return $this;
    }

    /**
     * @return Collection|Noticias[]
     */
    public function getNoticia(): Collection
    {
        return $this->noticia;
    }

    public function addNoticium(Noticias $noticium): self
    {
        if (!$this->noticia->contains($noticium)) {
            $this->noticia[] = $noticium;
            $noticium->addCategorium($this);
        }

        return $this;
    }

    public function removeNoticium(Noticias $noticium): self
    {
        if ($this->noticia->contains($noticium)) {
            $this->noticia->removeElement($noticium);
            $noticium->removeCategorium($this);
        }

        return $this;
    }

    public function __toString()
    {
        // TODO: Implement __toString() method.
return $this->nomcategoria;
    }

}
