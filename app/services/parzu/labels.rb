module Parzu
  class Labels
    LABELS = %w[
      APP
      ATTR
      AUX
      AVZ
      CJ
      DET
      EXPL
      GMOD
      GRAD
      KOM
      KON
      KONJ
      NEB
      OBJA
      OBJA2
      OBJC
      OBJD
      OBJG
      OBJI
      OBJP
      PAR
      PART
      PN
      PP
      PRED
      REL
      S
      SUBJ
      SUBJC
      VOK
      ZEIT
    ].freeze
  end

  def humanize(attr)
    if LABELS.include?(attr)
      I18n.t(attr)
    end
  end
end
