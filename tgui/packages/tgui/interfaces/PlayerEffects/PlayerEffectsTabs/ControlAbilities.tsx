// OV FILE
import { useBackend } from 'tgui/backend';
import { Button, Section } from 'tgui-core/components';

export const ControlAbilities = (props) => {
  const { act } = useBackend();

  return (
    <Section title="Grant Effects">
      <Button fluid onClick={() => act('spell_buffs')}>
        Give Spell Buffs
      </Button>
      <Button fluid onClick={() => act('order_buffs')}>
        Give Order Buffs
      </Button>
      <Button fluid onClick={() => act('divine_buffs')}>
        Give Divine Blessings
      </Button>
      <Button fluid onClick={() => act('song_buffs')}>
        Give Song Inspirations
      </Button>
      <Button fluid onClick={() => act('general_buffs')}>
        Give General Buffs
      </Button>
    </Section>
  );
};
